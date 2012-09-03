From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: Bug#649253: eeepc-wmi does not seem to adjust fan speed, but
 prevents use of fancontrol
Date: Mon, 3 Sep 2012 07:51:38 +0100
Message-ID: <CAHR064i6kdDfpO72oSqivyk3WW5d1Eq+v-Opx4zAK9ubcgKydw@mail.gmail.com>
References: <201209021710.03222.hans.ullrich@loop.de>
	<20120902195245.GA2187@mannheim-rule.local>
	<201209022247.02111.hans.ullrich@loop.de>
	<1346638306.7787.73.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:48342 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752366Ab2ICGvj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Sep 2012 02:51:39 -0400
Received: by qcro28 with SMTP id o28so3207577qcr.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 02 Sep 2012 23:51:38 -0700 (PDT)
In-Reply-To: <1346638306.7787.73.camel@deadeye.wl.decadent.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: "Hans-J. Ullrich" <hans.ullrich@loop.de>, Jonathan Nieder <jrnieder@gmail.com>, 649253@bugs.debian.org, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, Sep 3, 2012 at 3:11 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Sun, 2012-09-02 at 22:47 +0200, Hans-J. Ullrich wrote:
> [...]
>> Just to explain: eeepc-wmi will not be fixed, as the developers told me (almost
>> 2 years ago). The problem of this, is that the old hardware specs of my EEEPC
>> 1005 HGO are not made available by the vendor. So it is of course impossible,
>> to write a kernel module.
>>
>> All newer hardware, which is in most newer processors will be supported, of
>> course! But as I said, my EEEPC 1005 HGO with the old single core cpu (Intel
>> N280), still got the old and undocumentd API.
>>
>> > What steps exactly do you use to work around the bug?  What do you
>> > mean by "running the old kernel module"?  Are you using an older
>> > kernel?
>> >
>>
>> No, I can choose either to load eeepc-wmi or use the option "acpi_osi="Linux"
>> which let me load eeepc-laptop at startup. The second one I call the "old"
>> module, as this is the old fancontroller module developed for my old cpu.
>>
>> If eeepc-laptop is used, then eeepc-wmi will not be loaded.
> [...]
>
> Corentin, I assume you understand what's going on with these different
> drivers.  Shouldn't we add a dmi_enable_osi_linux quirk for the affected
> models in drivers/acpi/blacklist.c?
>
> Ben.

I think the wmi interface should be used when available, because it's
the one asus is using on Windows. Fan control was kind of working
using a methods that were probably not covered by Asus ACPI "ABI". So
my point of view is "not supported by vendor on windows, hard to do
with wmi: won't support it". Individuals can always boot with
acpi_os=Linux if they want to, but I don't want to make that the
default.

Thanks



-- 
Corentin Chary
http://xf.iksaif.net
