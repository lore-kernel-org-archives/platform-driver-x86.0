From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 14/14] sony-laptop: Documentation changes
Date: Fri, 09 Sep 2011 19:04:26 +0200
Message-ID: <1315587866.3613.107.camel@vesuvio>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:52367 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759162Ab1IIRE3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Sep 2011 13:04:29 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Since new findings occurred and we have a better understanding of the
SNC device, the development documentation is updated.

Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/Documentation/laptops/sony-laptop.txt
+++ b/Documentation/laptops/sony-laptop.txt
@@ -88,15 +88,36 @@ REPEAT: DON'T DO THIS IF YOU DON'T LIKE 
 In your kernel logs you will find the list of all ACPI methods
 the SNC device has on your laptop.
 
-* For new models you will see a long list of meaningless method names,
-reading the DSDT table source should reveal that:
-(1) the SNC device uses an internal capability lookup table
-(2) SN00 is used to find values in the lookup table
-(3) SN06 and SN07 are used to call into the real methods based on
-    offsets you can obtain iterating the table using SN00
-(4) SN02 used to enable events.
-Some values in the capability lookup table are more or less known, see
-the code for all sony_call_snc_handle calls, others are more obscure.
+* For new models you may see a long list of meaningless method names,
+but a small subset of methods starting with "SN" is always present.
These
+methods define a common interface for acting with the SNC device. In
+particular:
+
+- SN00 can be used to retrieve some informations about the SNC device;
among
+  them, an internal capability lookup table reporting model specific
features,
+  identified by a number called "handle", associated to an offset, to
be
+  later used by methods SN06 and SN07. Some handles are now well known,
while
+  some others are still a bit obscure or totally unknown. A list of
known
+  handles can be found at
http://www.absence.it/vaio-acpi/handles_list.txt
+
+- SN01, SN02, SN03 can be used to query, enable and disable
(respectively)
+  the event generation for every handle, as they might trigger ACPI
+  notifications
+
+- SN04, SN05 can be used to query and clear the "event raised" flag for
every
+  handle
+
+- SN06 and SN07 are used to call into the real methods, providing the
handles
+  specific features, based on offsets you can obtain iterating the
table
+  via SN00. They should provide the same info (or almost the same), but
while
+  SN07 uses 32bit integers for both input and output parameters SN06
returns a
+  wide buffer (for both input and output values), useful for reading a
few info
+  tables or long input parameters.
+
+You can have a look at a decoded, analyzed and fully explained DSDT
taken from
+a Sony Vaio VPCS1 model at
http://www.absence.it/vaio-acpi/VPCS-findings.txt.
+It should significantly help you in understanding how to use
handles/offsets,
+in decoding other DSDTs and in discovering new unknown features.
 
 * For old models you can see the GCDP/GCDP methods used to pwer on/off
 the CD drive, but there are others and they are usually different from
