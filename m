From: Mario Limonciello <superm1@ubuntu.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 16:52:51 -0500
Message-ID: <AANLkTinSgzLtNk1nrVejX0zafxzE0mG-p6rHD8dnhJBP@mail.gmail.com>
References: <AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
	<20101007133529.GA21782@srcf.ucam.org>
	<AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
	<20101007205049.GB32726@srcf.ucam.org>
	<AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com>
	<20101007213027.GA18628@core.coreip.homeip.net>
	<20101007213754.GA1896@srcf.ucam.org>
	<AANLkTinL9UckjiQGmMJ_NENPp9XxFHRdvTje_V46LPQ+@mail.gmail.com>
	<20101007214212.GA2010@srcf.ucam.org>
	<AANLkTimh649Lhj-sBYzViq_G-2Bva0U-TPCMGfSdK=QE@mail.gmail.com>
	<20101007214927.GA2292@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36868 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764Ab0JGVww convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 17:52:52 -0400
In-Reply-To: <20101007214927.GA2292@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 7, 2010 at 16:49, Matthew Garrett <mjg59@srcf.ucam.org> wro=
te:
> On Thu, Oct 07, 2010 at 04:45:22PM -0500, Mario Limonciello wrote:
>> Matthew:
>>
>> On Thu, Oct 7, 2010 at 16:42, Matthew Garrett <mjg59@srcf.ucam.org> =
wrote:
>> > I don't understand this. You know which code is broken - surely yo=
u're
>> > able to determine which products shipped with BIOSes derived from =
the
>> > broken code?
>>
>> Not all product's BIOS are developed in-house. =A0The ones that are,=
 yes
>> it quite possible to identify. =A0Matter of fact, this issue tends t=
o
>> not exist on the in-house developed BIOS codebase.
>
> Ok, so let's approach this differently. What is it that results in th=
is
> issue not affecting Windows?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>

Depending on the third-party vendor that worked on the BIOS, they may
have an additional method for modifying the wireless and another tool
in addition to the standard one used on a majority of the machines.
That method is not necessarily documented.

--=20
Mario Limonciello
superm1@gmail.com
