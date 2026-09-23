Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711FF49DBBB;
	Wed, 23 Sep 2026 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167527; cv=pass; b=Qta6e9diQrMc8hCJ6jqGAGxhOI4AVc1w6yI7YDlL48HqWqGZI2L9OT1I7GUQ3BrGmcKlGj8C/67bPk7k8dHjNb0fh21HePzS3g+YOK5JXxdA7ECmtPN+V6FWIDWNGp6PLg6dv9nlrSaQAi7+k58qANEHXJ5akdUeeZUEpnJj05s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167527; c=relaxed/simple;
	bh=jj1AOuCIcxY/zK8x6QtMFcibXeLxM3qQRNS7n+GW1hw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HntyQXhFvTno4H8cu2lUG3r1xouWM6CVQfToEsZWoHcnMr3XqXRcafYRTxaUYXgYuXRu4m0c2j9pHCR+bzoS7L3IsgFRls2i5E3z21d1Yfek+6RpWaTJnPdRWytWw6BDIPb6Zm+EqbHkM3mK/mGxQDHSPsZ85YGzYZ3Zm1frzeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ai4VAzoH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ai4VAzoH"
ARC-Seal: i=1; a=rsa-sha256; t=1790167500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nweW1TdROckMimZPqz5KfxcMs+yqWWIiji/92FJqLvzokpIyEkoP7DilWV18d13OuTSRy3xI6AhxnZbJhWqM2k/1k20qb7DqaO42KXRxatqZI2aqW4EwKtIExELTyY2+9U/RjrIqtJ4PXxblYrdHnBxXdj7G1FDApfsjdE9R2lQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790167500; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ETmeRL9mexlf/VtcVrEkv+CMo3bzi/q4xz4aXyPSUEs=; 
	b=mkY7qkOoSWn2wXzJeoaXKw7Xio4NI2o26BIKZyx2Ul1mzzxTNhYB4ojMDeLPEg9nwCF1hcLU4e/w+8hP910dDn/UtRvi5BaFdsoHZs/U21qFry0yCag64ubl4mRjMccuyDVQKCSjfv1Rhya4XKjQY7+areP+OBB2rEaigPTCLsY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790167500;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=ETmeRL9mexlf/VtcVrEkv+CMo3bzi/q4xz4aXyPSUEs=;
	b=Ai4VAzoHokkctz3nR/hJQ5zRaUW6DmrDRYgsAiAI2UI26t3AXoi1M2QiIuLBYMXF
	9PRLtE0IUTHwQ364YbuQ51dw7CR+ZiUZpzuH6LgkSl6LIC8SH6MqMDr3E4QbnHPTWP2
	2iy8xc+KQKJ8lFupZ463mbOfPhnn3+Q+2fP1NahST+0Ymo08TVTNFlpukzDCHEM/AKP
	kBLgrjXN7KukvlNL2ZMpbSlsUuXzRItjkW4ksGMcZ2JPJSYICjRfNzIkPQ/ZLBKXXDn
	5LOWzXa4gWZQS6q75UsUDq1yVXLWnnkoSq1pLQkt6fxXguwUv23slzF1mOy1E8VFyIX
	1WADcK6BSg==
Received: by smtp.zohomail.com with SMTPS id 1790167499115216.26734243271835;
	Wed, 23 Sep 2026 05:44:59 -0700 (PDT)
Message-ID: <356cc2817ce72c4f2d7b4f623ae73b979d314ac8.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch
 as SW_CAMERA_LENS_COVER
From: Rong Zhang <i@rong.moe>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: derekjohn.clark@gmail.com, hansg@kernel.org, huangwei@kylinos.cn, 
	ikepanhc@gmail.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, 	mpearson-lenovo@squebb.ca,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <SN6PR19MB230365BE74C6A502EBB4F35DFC822@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <22C70C72-1C43-4777-AD11-D5A6EA85A0F1@rong.moe>
	 <SN6PR19MB230365BE74C6A502EBB4F35DFC822@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 20:39:53 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Marco,

Thanks for the detailed information.

On Wed, 2026-09-23 at 13:17 +0200, Marco Giunta wrote:
> Hi Rong & Mark,
>=20
> thanks a lot for the impressively detailed and informative replies
> (as always). Here's an update from me.
>=20
> 1. overall I changed my mind regarding the conditional switch registratio=
n.
> I no longer really see it as particularly problematic in practice; as Ron=
g
> said earlier, in practice it's mostly a theoretical concern given the
> typical userspace usage of this switch.
>=20
> I do agree that if we can find a smart way to filter for switch presence
> based on a good criterion, like a suitable wmi method, it would
> definitively be an improvement to patch v3. And I also appreciate that
> gaining a better understanding of these issues may improve other lenovo
> drivers. Finally, in general, I am certainly not trying to stifle the
> useful discussion going on here; what I'm trying to say is: as far as the
> camera switch patch is concerned, I am perfectly fine with the simple
> approach of v3 (at least for now, we can add more complexity later IMO).

Agreed. More comments below.

>=20
> 2. here https://github.com/marco-giunta/lenovo-acpi-dump you can find
> all raw & decompiled ACPI tables and bmof files from both my yoga and my
> legion. Feel free to ask for more data.

Good job. They are exactly what I want to cross-check with. They'll also
be useful when I develop future patches for lenovo-wmi-*.

>=20
> 3. Let me clarify what I meant when I said that the yoga and the lenovo
> handle the switch differently (and more generally report some highlights
> from the above files).
>=20
> The yoga's SSDT2 table contains:
>=20
> Device (WMIU)
> {
>     Name (_HID, "PNP0C14" /* Windows Management Instrumentation Device */=
)  // _HID: Hardware ID
>     Name (_UID, "LSK20")  // _UID: Unique ID
>     Name (LSKE, 0x02)
>     Name (_WDG, Buffer (0x3C)
>     {
>         /* 0000 */  0x74, 0x09, 0x6C, 0xCE, 0x07, 0x04, 0x50, 0x4F,  // t=
.l...PO
>         /* 0008 */  0x88, 0xBA, 0x4F, 0xC3, 0xB6, 0x55, 0x9A, 0xD8,  // .=
.O..U..
>         /* 0010 */  0x53, 0x4B, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // S=
K..!...
>         /* 0018 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f=
.......
>         /* 0020 */  0xC9, 0x06, 0x29, 0x10, 0x44, 0x41, 0x01, 0x00,  // .=
.).DA..
>         /* 0028 */  0x0C, 0xDE, 0xC0, 0x8F, 0xE4, 0xB4, 0xFD, 0x43,  // .=
......C
>         /* 0030 */  0xB0, 0xF3, 0x88, 0x71, 0x71, 0x1C, 0x12, 0x94,  // .=
..qq...
>         /* 0038 */  0xD0, 0x00, 0x01, 0x08                           // .=
...
>     })
>=20
> so GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 on device WMIU, event (0x08)
> with notify value 0xD0, no surprises here.
>=20
> Its _WED method is:
>=20
> Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=3D0x00-0xFF
> {
>     If ((Arg0 =3D=3D 0xD0))
>     {
>         Return (PSD1) /* \PSD1 */
>     }
> }
>=20
> so "notify" =3D "return PSD1". Then below:
>=20
> Scope (\_SB.PCI0.LPC0.EC0)
> {
> ...
>     Method (_Q29, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
>         {
>             If ((\_SB.PCI0.LPC0.EC0.COSD =3D=3D 0x02))
>             {
>                 PSD1 =3D 0x0C
>             }
>             ElseIf ((\_SB.PCI0.LPC0.EC0.COSD =3D=3D Zero))
>             {
>                 PSD1 =3D 0x0D
>             }
>=20
>             Notify (\_SB.WMIU, 0xD0) // Hardware-Specific
>         }
> }
>=20
> So the camera on/off 0x0c/0x0d events are sent based on the COSD memory
> register in the EC.
>=20
> This COSD variable is never referred to again anywhere else in the ACPI t=
ables.

Then we can't query the switch's state via WMI on the Yoga.

>=20
> On the Legion:
>=20
> Device (WMIU)
>     {
>         Name (_HID, "PNP0C14" /* Windows Management Instrumentation Devic=
e */)  // _HID: Hardware ID
>         Name (_UID, "LSK20")  // _UID: Unique ID
>         Name (_WDG, Buffer (0x3C)
>         {
>             /* 0000 */  0x74, 0x09, 0x6C, 0xCE, 0x07, 0x04, 0x50, 0x4F,  =
// t.l...PO
>             /* 0008 */  0x88, 0xBA, 0x4F, 0xC3, 0xB6, 0x55, 0x9A, 0xD8,  =
// ..O..U..
>             /* 0010 */  0x53, 0x4B, 0x01, 0x02, 0x0C, 0xDE, 0xC0, 0x8F,  =
// SK......
>             /* 0018 */  0xE4, 0xB4, 0xFD, 0x43, 0xB0, 0xF3, 0x88, 0x71,  =
// ...C...q
>             /* 0020 */  0x71, 0x1C, 0x12, 0x94, 0xD0, 0x00, 0x01, 0x08,  =
// q.......
>             /* 0028 */  0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,  =
// !...f...
>             /* 0030 */  0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,  =
// ......).
>             /* 0038 */  0x44, 0x41, 0x01, 0x00                           =
// DA..
>=20
>             })
>=20
> Same 8fc0... GUID, same [0xD0, 0x00, 0x01, 0x08] sequence. Then:
>=20
> Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=3D0x00-0xFF
>     {
>         If ((Arg0 =3D=3D 0xD0))
>         {
>             Return (LSKD) /* External reference */
>         }
>     }
>=20
> But here this LSKD variable is written to with different logic. The relev=
ant
> EC query handler is:
>=20
> Method (_QDF, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
>     {
>         P80B =3D 0xDF
>         Sleep (0x05)
>         LSKD =3D Zero
>         If ((LSKV !=3D Zero))
>         {
>             LSKD =3D LSKV /* \_SB_.PCI0.LPC0.EC0_.LSKV */
>             If ((LSKD =3D=3D 0x02)){}
>             If ((LSKD =3D=3D 0x03)){}
>             LSKV =3D Zero
>         }
>=20
>         Notify (WMIU, 0xD0) // Hardware-Specific
>         Notify (GZFD, 0xE8) // Hardware-Specific
>     }
>=20
> so there are no assignments of 0x0c/0x0d like on the Yoga: the EC itself
> writes the event code into LSKV (a byte at offset 0x1F of the ERAX region=
,
> SystemMemory 0xFEEC2400), and the AML only copies it to LSKD and clears
> the mailbox.
>=20
> The constants therefore appear to live in the EC firmware rather than
> in the ACPI tables, and no AML-visible object keeps the switch state,
> unlike COSD on the Yoga (which is at least readable in principle, even if
> nothing else reads it).
>=20
> Overall, the firmware appears to work differently internally, and I wasn'=
t
> able to find a common interface that a driver could use for this without
> resorting to per-model EC details (see below), though I may be missing
> something.
>=20
> 4. Unless I'm missing something, the IDs Mark mentioned don't really appl=
y
> here.
>=20
> 0x00201000 does not appear anywhere in either machine's tables - consiste=
nt
> with Mark's point that this ID is new; both of my devices were released i=
n
> 2025.
>=20
> 0x00200000 appears a few times in SSDT2 (yoga)/SSDT5 (legion) in contexts=
 that
> look unrelated (bitmask arithmetic in DYTC on the Yoga, and in the GPS
> method on the Legion), plus once in the Yoga's capability data, see below=
.
>=20
> LENOVO_OTHER_METHOD is implemented on both machines as \_SB.GZFD.WMAE
> (object "AE" in the GZFD _WDG, flags 0x02 =3D method). Since the MOF
> declares GetFeatureValue as WmiMethodId(17), the relevant branch is
> Arg1 =3D=3D 0x11, the same one as in Rong's 83JR snippet. As far as I can
> tell neither machine handles the two shutter IDs there: the Yoga has logi=
c
> to dispatch based on device/feature bytes (and covers device 0 features
> 0x02 and 0x08, device 4 feature 0x03, and device 8 feature 0x01); instead
> the Legion compares whole IDs and its device-0 list goes from
> 0x001F0000 straight to 0x00210000. Unhandled IDs return Zero in both
> cases, which, if 0 means "closed", would make those IDs report a closed
> shutter regardless of the switch position. I would appreciate a second
> opinion on this reading, though.
>=20
> As for the capability data, the Yoga implements LENOVO_CAPABILITY_DATA_00=
,
> defined in the bmof as
>=20
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LEN=
OVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}")]
> class LENOVO_CAPABILITY_DATA_00 {
>   [key, read] string InstanceName;
>   [read] boolean Active;
>   [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
>   [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
>   [WmiDataId(3), read, Description("Capability Default Value.")] uint32 D=
efaultValue;
> };
>=20
> This object is implemented in the acpi tables with GUID
> 362A3AFE-3D96-4665-8530-96DAD5BB300E, object id "B0", as WQB0 -> GCD0,
> which returns the three dwords of each element of the CD00 package.
> CD00 enumerates the feature IDs in ascending order, and includes
>=20
>     { 0x001F0000, Zero, Zero },
>     { 0x00200000, Zero, Zero },
>     { 0x00210000, Zero, Zero },
>=20
> while other entries in the same table have capability values such as
> 0x07, 0x09, 0x05, 0x03 and One. If the capability field is the bitmask
> from Mark's table, this would mean the CV DSP Camera Shutter is enumerate=
d
> but declared as not supported on this model. (and again there is no
> 0x00201000 entry)

Just checked the SSDT2 table of Yoga, and I found the implementation of
WMIU very similar to my device (ThinkBook 14 G7+ ASP). Mine has no
0x00200000 package though, which makes some sense as it has a passive
shutter that physically covers the camera.

Perhaps the Yoga Pro 7 14ASP10 was developed in the direction of
supporting 0x00200000, but the dev team eventually removed it before
releasing.

>=20
> The Legion's capability data (same 362a... GUID) is built by WQA9 from
> hardcoded buffers rather than from a package, and has no entry for
> 0x00200000 at all.

Then we can't query the switch's state via WMI on the Legion.

>=20
> So while these interfaces look like the right way to expose
> SW_CAMERA_LENS_COVER conditionally on firmware that implements them
> (like on the 83JR platform), they do not seem usable on these two models.

Agreed.

>=20
> 5. I have basically no experience parsing WMI data and very little with
> ACPI tables in general. Please feel free to correct me! And in general
> take the above with a pinch of salt.
> I hope the linked files will prove more useful than me in this regard.

Your interpretation is well done and impressive!

In conclusion, I agreed that we should take the simple approach, i.e.,
exposing KEY_SW unconditionally. If we see a report for a 0x00200000-
capable device, we can add support for it then. For the time being, let's
focus on what we have first.

>=20
>=20
> Thanks again for your work on this, I am learning a lot from this thread.

Thanks a lot for your help, too.

I will submit my patch with your C-d-b, S-o-b, and T-b.

Thanks,
Rong

>=20
> Best regards,
> Marco
