From: Marek Vasut <marek.vasut@gmail.com>
Subject: Acer-WMI: Iconia TAB W500 gyrosensor
Date: Tue, 1 May 2012 17:31:24 +0200
Message-ID: <201205011731.24642.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:56893 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751928Ab2EAPb3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 May 2012 11:31:29 -0400
Received: by wgbds11 with SMTP id ds11so3259694wgb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 May 2012 08:31:27 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@novell.com
Cc: platform-driver-x86@vger.kernel.org

Hello,

I've been poking around the W500 gyrosensor.

* When the device is tilted, it generates PNP0C14 event.
* This is caught by acer_wmi_notify() in drivers/platform/x86/acer-wmi.c

Now it gets interesting ;-)

The obj->buffer.pointer contains the following:
0x05 0x01 0x00 0x00 0x00 0x00 0x00 0x00

That means, return_value.function is 0x05, instead of 0x01 (WMID_HOTKEY_EVENT). 
I've been poking around for quite a bit, but so far didn't get any further data 
from it but this event. Any idea how to progress please? I think I just need to 
call some of the methods (see below) that'll return the values from the 
gyrosensor.

Find "fwts wmi -" below:

00012 wmi             Test 1 of 2: Check Windows Management Instrumentation in 
DSDT
00013 wmi             Found WMI Event, Notifier ID: 0xbc, GUID: 
676AA15E-6A47-4D9F-A2CC-1E6D18D14026, Instance 0x01
00014 wmi             PASSED: Test 1, GUID 676AA15E-6A47-4D9F-A2CC-1E6D18D14026 
is handled by driver acer-wmi (Vendor: Acer).
00015 wmi             Found WMI Method WMAA with GUID: 61EF69EA-865C-4BC3-A502-
A0DEBA0CB531, Instance 0x01
00016 wmi             PASSED: Test 1, GUID 61EF69EA-865C-4BC3-A502-A0DEBA0CB531 
is handled by driver acer-wmi (Vendor: Acer).
00017 wmi             Found WMI Method WMBL with GUID: 
FE1DBBDA-3014-4856-870C-5B3A744BF341, Instance 0x01
00018 wmi             Found WMI Method WMBE with GUID: 
79772EC5-04B1-4BFD-843C-61E7F77B6CC9, Instance 0x01
00019 wmi             Found WMI Method WMBK with GUID: F75F5666-B8B3-4A5D-
A91C-7488F62E5637, Instance 0x01
00020 wmi             Found WMI Object, Object ID AB, GUID: 05901221-D566-11D1-
B2F0-00A0C9062910, Instance 0x01, Flags: 00 
00021 wmi             Found WMI Object, Object ID 00, GUID: 39142400-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00022 wmi             Found WMI Object, Object ID 01, GUID: 49142400-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00023 wmi             Found WMI Object, Object ID 02, GUID: 4A142400-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00024 wmi             Found WMI Object, Object ID 11, GUID: 49142401-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00025 wmi             Found WMI Object, Object ID 12, GUID: 4A142401-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00026 wmi             Found WMI Object, Object ID 21, GUID: 49142402-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00027 wmi             Found WMI Object, Object ID 22, GUID: 4A142402-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE                                            
00028 wmi             Found WMI Object, Object ID 31, GUID: 49142403-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE                                            
00029 wmi             Found WMI Object, Object ID 32, GUID: 4A142403-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE                                            
00030 wmi             Found WMI Object, Object ID 41, GUID: 49142404-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE                                            
00031 wmi             Found WMI Object, Object ID 42, GUID: 4A142404-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE                                            
00032 wmi             Found WMI Object, Object ID 51, GUID: 49142405-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE                                            
00033 wmi             Found WMI Object, Object ID 52, GUID: 4A142405-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00034 wmi             Found WMI Object, Object ID 61, GUID: 49142406-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00035 wmi             Found WMI Object, Object ID 62, GUID: 4A142406-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00036 wmi             Found WMI Object, Object ID 71, GUID: 49142407-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00037 wmi             Found WMI Object, Object ID 72, GUID: 4A142407-C6A3-40FA-
BADB-8A2652834100, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00038 wmi             Found WMI Event, Notifier ID: 0x80, GUID: 59142400-
C6A3-40FA-BADB-8A2652834100, Instance 0x01
00039 wmi             FAILED [MEDIUM] WMIUnknownGUID: Test 1, GUID 59142400-
C6A3-40FA-BADB-8A2652834100 is unknown to the kernel, a driver may need to be 
implemented for this GUID.
00040 wmi             
00041 wmi             ADVICE: A WMI driver probably needs to be written for this 
event.
00042 wmi             It can checked for using: wmi_has_guid("59142400-
C6A3-40FA-BADB-8A2652834100").
00043 wmi             One can install a notify handler using 
wmi_install_notify_handler("59142400-C6A3-40FA-BADB-8A2652834100", handler, 
NULL). 
00044 wmi             http://lwn.net/Articles/391230 describes how to write an 
appropriate driver.
00045 wmi             
00046 wmi             Found WMI Method WM05 with GUID: 69142400-C6A3-40FA-
BADB-8A2652834100, Instance 0x01
00047 wmi             Found WMI Method WM06 with GUID: 79142400-C6A3-40FA-
BADB-8A2652834100, Instance 0x01
00048 wmi             Found WMI Method WM07 with GUID: 89142400-C6A3-40FA-
BADB-8A2652834100, Instance 0x01
00049 wmi             Found WMI Object, Object ID BA, GUID: 05901221-D566-11D1-
B2F0-00A0C9062910, Instance 0x01, Flags: 01 WMI_EXPENSIVE 
00050 wmi             
00051 wmi             Test 2 of 2: Check Windows Management Instrumentation in 
SSDT
00052 wmi             No WMI data found in table SSDT1.
00053 wmi             No WMI data found in table SSDT2.

Best regards,
Marek Vasut
