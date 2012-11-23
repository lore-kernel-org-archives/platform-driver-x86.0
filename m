From: Justin Chudgar <justin@justinzane.com>
Subject: Acer Aspire 5733 - acer_wmi problems
Date: Fri, 23 Nov 2012 11:47:02 -0800
Message-ID: <50AFD2B6.6050502@justinzane.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010805020308010800030703"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from tiny.justinzane.com ([216.7.117.181]:60437 "EHLO
	happy.justinzane.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751899Ab2KWT5d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Nov 2012 14:57:33 -0500
Received: from happy.justinzane.com (media01.local [192.168.0.50])
	by happy.justinzane.com (Postfix) with ESMTP id 0A1B0180195D1
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Nov 2012 11:47:05 -0800 (PST)
Received: from [192.168.0.180] (unknown [192.168.0.180])
	by happy.justinzane.com (Postfix) with ESMTPSA id 9618D180195D1
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Nov 2012 11:47:03 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------010805020308010800030703
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have an Acer Aspire 5733 that is having issues with:
- <fn>+<brightness/volume/suspend/etc.> key combos not working
- screen not resuming when unplugging/replugging a system while system
continues operating

Could someone please help me determine how to triage these and direct me
on what info the maintainer needs from me.

Thank you.

##### Excerpt from lshw #####
   description: Notebook
    product: Aspire 5733 (Calpella_CRB)
    vendor: Acer
    version: V1.07
    serial:
NXRN5AA00221703D023400                                                                           

    width: 64
bits                                                                                           

    capabilities: smbios-2.6 dmi-2.6
vsyscall32                                                              
    configuration: boot=normal chassis=notebook family=Intel_Mobile
sku=Calpella_CRB
uuid=F5E6A1B5-81FF-11E1-A5D0-DC0EA1AC38D5                                                                                             

 
*-core                                                                                                     

       description: Motherboard
       product: Aspire 5733
       vendor: Acer
       physical id: 0
       version: V1.07
       serial: Base Board Serial Number
       slot: Base Board Chassis Location
     *-firmware
          description: BIOS
          vendor: Acer
          physical id: 0
          version: V1.07
          date: 11/07/2011
          size: 1MiB
          capacity: 1472KiB
          capabilities: pci upgrade shadowing cdboot bootselect edd
int13floppynec int13floppytoshiba int13floppy360 int13floppy1200
int13floppy720 int13floppy2880 int9keyboard int10video acpi usb
biosbootspecification

-- 
Justin Chudgar  |  Weed, CA 96094  |  530 921 0738 | http://www.justinzane.com/


--------------010805020308010800030703
Content-Type: text/x-vcard; charset=utf-8;
 name="justin.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="justin.vcf"

begin:vcard
fn:Justin Chudgar
n:Chudgar;Justin
email;internet:justin@justinzane.com
tel;cell:530-921-0738
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------010805020308010800030703--
