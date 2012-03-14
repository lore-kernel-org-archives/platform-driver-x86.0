From: Vaclav Mocek <vmocek@gmail.com>
Subject: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Wed, 14 Mar 2012 03:01:49 +0000
Message-ID: <4F600A1D.5060002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:44835 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030539Ab2CNDCN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Mar 2012 23:02:13 -0400
Received: by wejx9 with SMTP id x9so1222324wej.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Mar 2012 20:02:12 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@novell.com
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

Hi all,

I am an unhappy owner of Lenovo Ideapad S205 and the drivers in the 
current development kernel (2f1c2b8) soft-blocks its Wi-Fi. S205 loads 
two kernel modules - ideapad-laptop.c and acer-wmi.c. The rfkill is 
controlled by acer-wmi.c and there is already a support for S205:

     {
         .callback = dmi_matched,
         .ident = "Lenovo Ideapad S205",
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
             DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
         },
         .driver_data = &quirk_lenovo_ideapad_s205,
     },

Unfortunately, my netbook has a different DMI_PRODUCT_NAME - "Brazos" 
instead of "10382LG" and there are at least eighteen possibilities [1]. 
I spent some time Googling, comparing Smolt profiles, reading S205 
Hardware Maintenance Manual [2]  and analysing the BIOS updates. It 
seems, that all S205 are based on AMD platform called "Inagua" (E300, 
E350, E450), use two types of Wi-Fi cards (RaLink RT3090 and AR9285), 
various combination of SO DIMMs (2 x 1GB, 1 x 2GB, 2 x 2GB), different 
sizes of hardrives and different keyboard layouts; so overall there are 
pretty much the same.

There is a rare netbook called Lenovo Ideapad S205s ("s" at the end), 
but this one is based on Intel's processors [3].

My proposal is very simple:

     {
          .callback = dmi_matched,
          .ident = "Lenovo Ideapad S205",
          .matches = {
              DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-            DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
+            DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad S205"),
          },
          .driver_data = &quirk_lenovo_ideapad_s205,
      },

It works. We are not able to test all product names and if the checking 
of DMI_PRODUCT_NAME is really required, it should be done in an 
additional step. The current situation is pretty bad - problems with 
UEFI booting (the only possibility)[4], impossibility to switch the 
power off, failing brightness control - and without a functional network 
connection for a start, it is better to throw it out of the window.

[1] 
http://smolt.fedoraproject.org/reports/view_profiles?profile=Ideapad+S205&search=Submit+Query
[2] http://www.manualowl.com/m/Lenovo/IdeaPad-S205/Manual/192357
[3] http://www.manualowl.com/m/Lenovo/IdeaPad-S205s/Manual/227621
[4] 
http://fedoraproject.org/wiki/Common_F16_bugs#UEFI_install_to_Lenovo_Ideapad_S205_fails_to_boot


Best Regards

Vaclav Mocek
