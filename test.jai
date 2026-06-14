#import "Basic";
Xml :: #import,file "module.jai";

main :: () {
  root := Xml.parse_xml(TEST_XML);
  assert(root != null);
  Xml.print_xml(root, false);
  Xml.delete_xml(root);
}

// The test XML content is a subset of XML provided at
// /usr/share/wayland/wayland.xml for Wayland version 1.22.0-2.1build1
// on an Ubuntu 24.04 system.
TEST_XML :: #string EOS
<?xml version="1.0" encoding="UTF-8"?>
<protocol name="wayland">

  <copyright>
    Copyright © 2008-2011 Kristian Høgsberg
    Copyright © 2010-2011 Intel Corporation
    Copyright © 2012-2013 Collabora, Ltd.

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation files
    (the "Software"), to deal in the Software without restriction,
    including without limitation the rights to use, copy, modify, merge,
    publish, distribute, sublicense, and/or sell copies of the Software,
    and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice (including the
    next paragraph) shall be included in all copies or substantial
    portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
    BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
    ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
  </copyright>

  <interface name="wl_display" version="1">
    <description summary="core global object">
      The core global object.  This is a special singleton object.  It
      is used for internal Wayland protocol features.
    </description>

    <request name="sync">
      <description summary="asynchronous roundtrip">
	The sync request asks the server to emit the 'done' event
	on the returned wl_callback object.  Since requests are
	handled in-order and events are delivered in-order, this can
	be used as a barrier to ensure all previous requests and the
	resulting events have been handled.

	The object returned by this request will be destroyed by the
	compositor after the callback is fired and as such the client must not
	attempt to use it after that point.

	The callback_data passed in the callback is the event serial.
      </description>
      <arg name="callback" type="new_id" interface="wl_callback"
	   summary="callback object for the sync request"/>
    </request>

    <request name="get_registry">
      <description summary="get global registry object">
	This request creates a registry object that allows the client
	to list and bind the global objects available from the
	compositor.

	It should be noted that the server side resources consumed in
	response to a get_registry request can only be released when the
	client disconnects, not when the client side proxy is destroyed.
	Therefore, clients should invoke get_registry as infrequently as
	possible to avoid wasting memory.
      </description>
      <arg name="registry" type="new_id" interface="wl_registry"
	   summary="global registry object"/>
    </request>

    <event name="error">
      <description summary="fatal error event">
	The error event is sent out when a fatal (non-recoverable)
	error has occurred.  The object_id argument is the object
	where the error occurred, most often in response to a request
	to that object.  The code identifies the error and is defined
	by the object interface.  As such, each interface defines its
	own set of error codes.  The message is a brief description
	of the error, for (debugging) convenience.
      </description>
      <arg name="object_id" type="object" summary="object where the error occurred"/>
      <arg name="code" type="uint" summary="error code"/>
      <arg name="message" type="string" summary="error description"/>
    </event>

    <enum name="error">
      <description summary="global error values">
	These errors are global and can be emitted in response to any
	server request.
      </description>
      <entry name="invalid_object" value="0"
	     summary="server couldn't find object"/>
      <entry name="invalid_method" value="1"
	     summary="method doesn't exist on the specified interface or malformed request"/>
      <entry name="no_memory" value="2"
	     summary="server is out of memory"/>
      <entry name="implementation" value="3"
	     summary="implementation error in compositor"/>
    </enum>

    <event name="delete_id">
      <description summary="acknowledge object ID deletion">
	This event is used internally by the object ID management
	logic. When a client deletes an object that it had created,
	the server will send this event to acknowledge that it has
	seen the delete request. When the client receives this event,
	it will know that it can safely reuse the object ID.
      </description>
      <arg name="id" type="uint" summary="deleted object ID"/>
    </event>
  </interface>

  <interface name="wl_registry" version="1">
    <description summary="global registry object">
      The singleton global registry object.  The server has a number of
      global objects that are available to all clients.  These objects
      typically represent an actual object in the server (for example,
      an input device) or they are singleton objects that provide
      extension functionality.

      When a client creates a registry object, the registry object
      will emit a global event for each global currently in the
      registry.  Globals come and go as a result of device or
      monitor hotplugs, reconfiguration or other events, and the
      registry will send out global and global_remove events to
      keep the client up to date with the changes.  To mark the end
      of the initial burst of events, the client can use the
      wl_display.sync request immediately after calling
      wl_display.get_registry.

      A client can bind to a global object by using the bind
      request.  This creates a client-side handle that lets the object
      emit events to the client and lets the client invoke requests on
      the object.
    </description>

    <request name="bind">
      <description summary="bind an object to the display">
	Binds a new, client-created object to the server using the
	specified name as the identifier.
      </description>
      <arg name="name" type="uint" summary="unique numeric name of the object"/>
      <arg name="id" type="new_id" summary="bounded object"/>
    </request>

    <event name="global">
      <description summary="announce global object">
	Notify the client of global objects.

	The event notifies the client that a global object with
	the given name is now available, and it implements the
	given version of the given interface.
      </description>
      <arg name="name" type="uint" summary="numeric name of the global object"/>
      <arg name="interface" type="string" summary="interface implemented by the object"/>
      <arg name="version" type="uint" summary="interface version"/>
    </event>

    <event name="global_remove">
      <description summary="announce removal of global object">
	Notify the client of removed global objects.

	This event notifies the client that the global identified
	by name is no longer available.  If the client bound to
	the global using the bind request, the client should now
	destroy that object.

	The object remains valid and requests to the object will be
	ignored until the client destroys it, to avoid races between
	the global going away and a client sending a request to it.
      </description>
      <arg name="name" type="uint" summary="numeric name of the global object"/>
    </event>
  </interface>
</protocol>
EOS;
