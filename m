From: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Subject: Re: Wireless key on Fujitsu E753 not working since a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Mon, 10 Feb 2014 09:42:07 +0100
Message-ID: <CAO_aot4ys3uK3ftBRvV5fMSqVKwupwBRTUU_Gf2AFcEgcw1VDw@mail.gmail.com>
References: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
	<CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
	<20130812144212.GA20923@marvin.atrad.com.au>
	<CAO_aot5117jj+sGCR2UXt2_kqH-j5VxcdQbuTrGMRewDVwPbiQ@mail.gmail.com>
	<20130924001149.GH12939@marvin.atrad.com.au>
	<CAO_aot6FkZBerjGKHfsjM03PVECM_cn3C+QirSojTg7AdOOAOA@mail.gmail.com>
	<20131130103023.GB1610@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:55017 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915AbaBJImJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 10 Feb 2014 03:42:09 -0500
Received: by mail-la0-f49.google.com with SMTP id y1so4491579lam.36
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2014 00:42:07 -0800 (PST)
In-Reply-To: <20131130103023.GB1610@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Thanks for your answer and sorry for the delay.
I finally got some time to look into this:
When I boot with the named boot option the key does work with and
without fujitsu_laptop being loaded.
Additionally I found a bug report at launchpad:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1159690 with some
more people affected by this, who are using notebooks from different
manufacturers, so this doesn't really seem to be related to
fujitsu_laptop module, does it?

Regards
jhs

2013-11-30 11:30 GMT+01:00 Jonathan Woithe <jwoithe@just42.net>:
> Jo Jan
>
> On Fri, Nov 22, 2013 at 08:36:23PM +0100, Jan Hinnerk Stosch wrote:
>> I just wanted to ask whether there is something I could do about this?
>
> I'm not sure.  To recap what you have found:
>
>> since commit "a57f7f9175b8ccbc9df83ac13860488913115de4" (bisected) the
>> wireless key on my Fujitsu E753 is not working any more. If I boot up
>> with parameter "acpi_osi="!Windows 2012"" it works, though.
>> I filed an ACPI-bug
>> (https://bugzilla.kernel.org/show_bug.cgi?id=60161), but was told
>> (https://bugzilla.kernel.org/show_bug.cgi?id=60161#c5) that this is
>> caused by the fujitsu_laptop driver. So I report it here. Should I
>> file a bug anywhere or is it enough to write it to the list?
>
> You then answered a followup question which indicated that if fujitsu_laptop
> module is *not* loaded the key still doesn't work.
>
> Does the key work without fujitsu_laptop loaded on a kernel before the
> commit in question?
>
> As I have said previously I am not sure I am in a position to offer
> assistance here.  Firstly I do not have access to any Fujitsu hardware other
> than my S7020, and that hardware does not implement a wireless key like the
> E753 does.  Secondly, I do not presently understand how the OSI changes in
> commit a57f7f9175b8ccbc9df83ac13860488913115de4 could affect the
> fujitsu_laptop module and break the handling of this "wireless key".
>
>> Should I ask in another mailing list or sth?
>
> I don't think so.  Platform-driver-x86 is the appropriate mailing list.
>
> As I said in an earlier email:
>
>> If someone could explain what the new _OSI string could be doing (or point
>> to documentation) I could try to work out what might be happening.  I am a
>> little restricted in what I can do though because I don't have fujitsu
>> hardware that supports the software RF kill switch.
>
> Understanding what this _OSI string does and how it could be causing
> fujitsu_laptop to loose control of the "wireless" key is fundamental to
> solving this problem.  I do not have this knowledge at this point in time,
> and I do not have the time available right now to start looking into the
> whole OSI thing from scratch.  Not having hardware affected by the problem
> also makes it difficult for me to investigate.
>
> To make progress with this issue, we need to work out what this OSI change
> has done to the seemingly unrelated code in fujitsu_laptop.  This involves
> working out what OSI does in the first place.
>
> Sorry that I can't be more definitive than this.
>
> Regards
>   jonathan
