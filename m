From: "Koerber, Philip (GE Intelligent Platforms)" <Philip.Koerber@ge.com>
Subject: [PATCH] embedded 1288 fcbga arrandale cpu not detected in ips module - no gpu turbo
Date: Fri, 4 Feb 2011 15:55:30 +0100
Message-ID: <BBC019D537C16342B2754DEB36395C0C013AB5EA@BUDMLVEM06.e2k.ad.ge.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01CBC47B.B5D602F8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from exprod5og113.obsmtp.com ([64.18.0.26]:40159 "EHLO
	exprod5og113.obsmtp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377Ab1BDPBj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Feb 2011 10:01:39 -0500
Content-class: urn:content-classes:message
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01CBC47B.B5D602F8
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Kernel Maintainers,

I have observed, that on our SBC's the GPU turbo mode doesn't work. This =
happens only to those with embedded Arrandale (1288 FCBGA package) =
standard voltage (35W) CPU's. These CPU's do not have there an letter =
whereas the Mobile CPU has an M. So there seems to be a need to update =
the intel_ips.c in order to recognize the CPU's with  brand strings =
'Intel(R) Core(TM) i7 CPU         610  @ 2.53GHz' and  'Intel(R) =
Core(TM) i5 CPU         520  @ 2.40GHz'. I have prepared therefor =
following patch:


diff -urN linux-2.6.38-rc3/drivers/platform/x86/intel_ips.c =
linux/drivers/platform/x86/intel_ips.c
--- linux-2.6.38-rc3/drivers/platform/x86/intel_ips.c	2011-02-01 =
04:05:49.000000000 +0100
+++ linux/drivers/platform/x86/intel_ips.c	2011-02-04 15:25:40.205627688 =
+0100
@@ -1399,6 +1399,10 @@
 		limits =3D &ips_lv_limits;
 	else if (strstr(boot_cpu_data.x86_model_id, "CPU       U"))
 		limits =3D &ips_ulv_limits;
+	else if (strstr(boot_cpu_data.x86_model_id, "CPU         610"))
+		limits =3D &ips_sv_limits;
+	else if (strstr(boot_cpu_data.x86_model_id, "CPU         520"))
+		limits =3D &ips_sv_limits;
 	else {
 		dev_info(&ips->dev->dev, "No CPUID match found.\n");
 		goto out;


With best Regards,
Philip


Philip Koerber
Technical Support

+49 821 5034 178
Memminger Stra=DFe 14
86159 Augsburg
Germany



------_=_NextPart_001_01CBC47B.B5D602F8
Content-Type: application/octet-stream;
	name="embedded_arrandale_ips_patch"
Content-Transfer-Encoding: base64
Content-Description: embedded_arrandale_ips_patch
Content-Disposition: attachment;
	filename="embedded_arrandale_ips_patch"

ZGlmZiAtdXJOIGxpbnV4LTIuNi4zOC1yYzMvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfaXBz
LmMgbGludXgvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfaXBzLmMKLS0tIGxpbnV4LTIuNi4z
OC1yYzMvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWxfaXBzLmMJMjAxMS0wMi0wMSAwNDowNTo0
OS4wMDAwMDAwMDAgKzAxMDAKKysrIGxpbnV4L2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsX2lw
cy5jCTIwMTEtMDItMDQgMTU6MjU6NDAuMjA1NjI3Njg4ICswMTAwCkBAIC0xMzk5LDYgKzEzOTks
MTAgQEAKIAkJbGltaXRzID0gJmlwc19sdl9saW1pdHM7CiAJZWxzZSBpZiAoc3Ryc3RyKGJvb3Rf
Y3B1X2RhdGEueDg2X21vZGVsX2lkLCAiQ1BVICAgICAgIFUiKSkKIAkJbGltaXRzID0gJmlwc191
bHZfbGltaXRzOworCWVsc2UgaWYgKHN0cnN0cihib290X2NwdV9kYXRhLng4Nl9tb2RlbF9pZCwg
IkNQVSAgICAgICAgIDYxMCIpKQorCQlsaW1pdHMgPSAmaXBzX3N2X2xpbWl0czsKKwllbHNlIGlm
IChzdHJzdHIoYm9vdF9jcHVfZGF0YS54ODZfbW9kZWxfaWQsICJDUFUgICAgICAgICA1MjAiKSkK
KwkJbGltaXRzID0gJmlwc19zdl9saW1pdHM7CiAJZWxzZSB7CiAJCWRldl9pbmZvKCZpcHMtPmRl
di0+ZGV2LCAiTm8gQ1BVSUQgbWF0Y2ggZm91bmQuXG4iKTsKIAkJZ290byBvdXQ7Cg==

------_=_NextPart_001_01CBC47B.B5D602F8--
