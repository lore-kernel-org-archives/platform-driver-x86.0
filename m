From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 03 Mar 2011 11:17:04 +0800
Message-ID: <4D6F0830.1090905@canonical.com>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com> <201103022109.51600.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:37100 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757245Ab1CCDRP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 2 Mar 2011 22:17:15 -0500
In-Reply-To: <201103022109.51600.carlos@strangeworlds.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Joey Lee <jlee@novell.com>, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

Hi,

Here[1] is the output of wmidump for ideapad s10-3 and s12-via and ther=
e is no
WMI device of ideapad B550 and Y530.

[1] http://pastebin.ubuntu.com/574793/

=46or now, ideapad-laptop handles the VPC2004 devices that can be found=
 in most of
the ideapads (maybe all, but I can not sure). In my opinion, I do not t=
hink to
handle WMI in ideapad-laptop is reasonable unless we have an extra func=
tion on
ideapads and we can only control it with WMI driver.

On 03/03/2011 05:09 AM, Carlos Corbacho wrote:
> On Wednesday 02 Mar 2011 08:53:55 Joey Lee wrote:
>> =E6=96=BC =E4=B8=80=EF=BC=8C2011-01-03 =E6=96=BC 20:49 +0000=EF=BC=8C=
Matthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
>>
>>> It looks like this GUID is present in a surprisingly wide range of
>>> devices (eg, http://pastebin.com/8BY0Dg64 from a Vaio...), which me=
ans
>>> that it's probably not a safe assumption that reading from the EC w=
ill
>>> give us reasonable results. Do the Acer drivers definitely do that,
>>> rather than there being some SMI that returns the data?
>>
>> The AMW0 in acer-wmi not just used by acer machines:
>>
>> #define AMW0_GUID1              "67C3371D-95A3-4C37-BB61-DD47B491DAA=
B"
>>
>> It was also included in Lenovo Ideapad S12 and Vaio machines' DSDT. =
=46or
>> Lenovo Ideapad, that will be better handle by ideapad-laptop driver.
>=20
> They might not be - Matthew's original question still stands. The old=
 AMW0 was=20
> just a funny wrapper for direct BIOS calls - maybe we just need a dif=
ferent=20
> call here?
>=20
> What does Acer do - are they poking the EC directly, or is the call t=
o AMW0=20
> just different for these machines?
>=20
>> Could we just direct add those model to the blacklist in acer-wmi
>> driver? or we direct check dmi in acer-wmi for only support Acer
>> machines that were included AMW0 in DSDT?
>=20
> Interesting. If we can't autodetect whether it's a dummy interface or=
 not,=20
> then, we should change acer-wmi to whitelist what it does support - A=
cer,=20
> Fujistu Siemens and Medion - rather than trying to blacklist every ve=
ndor that=20
> crops up.
>=20
> -Carlos
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
