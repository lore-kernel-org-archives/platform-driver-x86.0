From: Jan Hinnerk Stosch <janhinnerk.stosch@gmail.com>
Subject: Re: Wireless key on Fujitsu E753 not working since a57f7f9175b8ccbc9df83ac13860488913115de4
Date: Wed, 19 Feb 2014 13:48:36 +0100
Message-ID: <CAO_aot5WrP84fvdeFEYPNBHivD+Ye5XBcxsW7A+1g0Gqipr8tQ@mail.gmail.com>
References: <CAO_aot5FJb1v6-CztDeuAPS7=-byULP-tMzF_DZhw6aG4A+vVw@mail.gmail.com>
	<CAO_aot4Ye=YwSvi6P2Nn=3r4N8OY03mPxXLj+mTd_ziRxb5LXA@mail.gmail.com>
	<20130812144212.GA20923@marvin.atrad.com.au>
	<CAO_aot5117jj+sGCR2UXt2_kqH-j5VxcdQbuTrGMRewDVwPbiQ@mail.gmail.com>
	<20130924001149.GH12939@marvin.atrad.com.au>
	<CAO_aot6FkZBerjGKHfsjM03PVECM_cn3C+QirSojTg7AdOOAOA@mail.gmail.com>
	<20131130103023.GB1610@marvin.atrad.com.au>
	<CAO_aot4ys3uK3ftBRvV5fMSqVKwupwBRTUU_Gf2AFcEgcw1VDw@mail.gmail.com>
	<20140216230633.GC29134@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:35694 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753655AbaBSMsh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 Feb 2014 07:48:37 -0500
Received: by mail-ve0-f169.google.com with SMTP id oy12so311031veb.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Feb 2014 04:48:36 -0800 (PST)
In-Reply-To: <20140216230633.GC29134@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Ok, thanks for your confirmation.

Regards,

jhs

2014-02-17 0:06 GMT+01:00 Jonathan Woithe <jwoithe@just42.net>:
> On Mon, Feb 10, 2014 at 09:42:07AM +0100, Jan Hinnerk Stosch wrote:
>> Thanks for your answer and sorry for the delay.
>
> No problem.
>
>> I finally got some time to look into this:
>> When I boot with the named boot option the key does work with and
>> without fujitsu_laptop being loaded.
>> Additionally I found a bug report at launchpad:
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1159690 with some
>> more people affected by this, who are using notebooks from different
>> manufacturers, so this doesn't really seem to be related to
>> fujitsu_laptop module, does it?
>
> I tend to agree.  The fact that the named boot option makes this work
> regardless of whether fujitsu_laptop is loaded or not indicates to me that
> the mechanism driving this key on your laptop does not involve
> fujitsu_laptop.  My guess at present is that on your laptop the key is
> implemented in a standard way and therefore the handling of it is taken care
> of by generic code.  By and large the code in fujitsu_laptop exists to deal
> with features on laptops which were implemented in non-standard ways.
> Affected laptops tend to be older (newer ones tend to comply more closely
> with what we'll call standards for the purposes of this discussion).  This
> would explain why fujitsu_laptop doesn't have any effect on the key.
>
> As to why the named boot option seems to affect the key, I don't know and
> can't offer any sugestions due to a lack of knowledge about the acpi_osi
> option and how it affects the ACPI subsystem.
>
> To summarise: based on the tests you have done I don't think this is related
> to the fujitsu_laptop module since the key's behaviour is not affected by
> the presence or absence of this module.
>
> Regards
>   jonathan
