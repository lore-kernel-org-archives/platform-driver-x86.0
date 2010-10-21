From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v2 2/2] eeepc-wmi: Add cpufv sysfs interface
Date: Thu, 21 Oct 2010 15:31:14 +0200
Message-ID: <AANLkTi=tNC8MVdVohdtKq+ENOfnsZAUe+5yPMBELsw5G@mail.gmail.com>
References: <1286840838-16844-1-git-send-email-chris@cnpbagwell.com>
	<1286840838-16844-2-git-send-email-chris@cnpbagwell.com>
	<AANLkTik3agz60dxGvuHTFOr=4aUdg9t5jRgFjO6q-3mp@mail.gmail.com>
	<AANLkTi=yyBqAY+Lt9kRZv0===6ivyVg-FsMO2=6ATC0r@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:64549 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755941Ab0JUNbP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Oct 2010 09:31:15 -0400
Received: by ewy7 with SMTP id 7so69475ewy.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2010 06:31:14 -0700 (PDT)
In-Reply-To: <AANLkTi=yyBqAY+Lt9kRZv0===6ivyVg-FsMO2=6ATC0r@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Thu, Oct 21, 2010 at 3:06 PM, Chris Bagwell <chris@cnpbagwell.com> w=
rote:
> On Thu, Oct 21, 2010 at 1:45 AM, Corentin Chary
> <corentin.chary@gmail.com> wrote:
>> On Tue, Oct 12, 2010 at 1:47 AM, =C2=A0<chris@cnpbagwell.com> wrote:
>>> From: Chris Bagwell <chris@cnpbagwell.com>
>>>
>>> eeepc-laptop provides a sysfs interface to read and control what it
>>> calls cpufv. =C2=A0When WMI is enabled, the ACPI interface changes =
slightly
>>> and becames a write-only control with 3 valid values.
>>>
>>> Expose cpufv again to allow for user space utils that can extended =
battery
>>> life noticably and come a little closer to parity with eeepc-laptop=
=2E
>>>
>>> Write-only is OK for most user space apps because read status was
>>> mostly used to prevent unneeded mode changes. =C2=A0Since this same=
 check
>>> to ignore changes to same mode also exists in the DSDT then it was
>>> wasted ACPI call.
>>>
>>> acpi_osi=3D"!Windows 2009" can be used for get back eeepc-laptop's
>>> read support of cpufv for debugging things such as behaviour
>>> during resume.
>>>
>>> This patch was tested with EEE PC 1005PE by monitoring powertop out=
put while
>>> writing values of "0", "1", and "2" and by reviewing the decompiled=
 DSDT of
>>> an 1201NL and comparing it to 1005PE's DSDT.
>>>
>>> Signed-off-by: Chris Bagwell <chris@cnpbagwell.com>
>>> ---
>
> [ ... ]
>
>>
>> Seems ok.
>> Matthew, could you add that one for inclusion in 2.6.37 ?
>>
>> Chris, could you document cpufv in
>> Documentation/ABI/testing/sysfs-platform-eeepc-wmi (see eeepc-laptop
>> example) ?
>> I don't think the lacking documentation should delay this patch beca=
use:
>> - most of platform-x86 are not documented at all
>> - the merge window is open, and we should'nt miss that.
>>
>> Thanks,
>>
>
> Sure thing. =C2=A0Are you OK as the contact for this interface? =C2=A0=
I assume
> the intent is not for author of patches.

I'm not the original author of the driver, and I'm not really the
"official" maintainer.

Yong will maintain this driver on the long term ?
If yes, please send a patch for MAINTAINER, and Chris will use your
name in the Doc file
If not, I shall declare myself maintainer for this driver, and Chris
will use mine as ABI contact

Thanks,
--=20
Corentin Chary
http://xf.iksaif.net
