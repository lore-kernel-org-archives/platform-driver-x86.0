Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD205C25B4E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Jan 2023 19:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjATTWg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Jan 2023 14:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjATTWf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 14:22:35 -0500
X-Greylist: delayed 213 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 20 Jan 2023 11:22:34 PST
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com [91.220.24.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7048169222
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 11:22:34 -0800 (PST)
Received: from [192.168.220.242] (ip-088-152-173-137.um26.pools.vodafone-ip.de [88.152.173.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4Nz8Rt6fdBzTgc9;
        Fri, 20 Jan 2023 19:18:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1674242332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f96wkxvQdC0lLyqRw2IWXLY7p7YujvPJDRj4OheXOFk=;
        b=DDTt5+7wGxUh5tuyaG4OUqznqOSzf7CZLxOhq4XY3UVkzlP+mDgNR83dUuRXu09SE89TlM
        FGbH8ISlE7ltzi8HVIz2q6EqO/vh/xe/rq1BjBNnlGZKDEL9doP82GkiZ5pc4Aaqoflqmh
        34oP6xutaeEDDN854Fc0isiMHhCKBO4=
Message-ID: <cb93fd68-5195-0d5e-cd40-5eba61df4c38@wildgooses.com>
Date:   Fri, 20 Jan 2023 20:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: en-GB
To:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
From:   Ed W <lists@wildgooses.com>
In-Reply-To: <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 19/01/2023 10:22, Hans de Goede wrote:

>>  /* Order in which the GPIO lines are defined in the register list */
>>  #define APU2_GPIO_LINE_LED1		0
>>  #define APU2_GPIO_LINE_LED2		1
>>  #define APU2_GPIO_LINE_LED3		2
>>  #define APU2_GPIO_LINE_MODESW		3
>> -#define APU2_GPIO_LINE_SIMSWAP		4
>> -#define APU2_GPIO_LINE_MPCIE2		5
>> -#define APU2_GPIO_LINE_MPCIE3		6
>> +#define APU2_GPIO_LINE_RESETM1		4
>> +#define APU2_GPIO_LINE_RESETM2		5
>> +#define APU2_GPIO_LINE_SIMSWAP		6
> I don't think this changing of GPIO ordering, or
> for that part the changing of the gpio_names from 
> "mpcie2_reset" to "modem1-reset" is a good idea.
>
> I'm not entirely sure how these GPIOs are supposed to be
> consumed / used by userspace. But since they are not used
> directly in this driver I assume userspace is supposed to
> use either the (deprecated) sysfs GPIO API or the new ioctl
> based GPIO API to toggle say "simswap" if it needs to.
>
> The old sysfs API exclusively uses pin-indexes inside a GPIO
> chip to select the pin, so by changing the pin order you
> have just broken the userspace API.
>
> And the new ioctl API can use either pin-indexes or GPIO-line-names,
> so by changing the names you have also just potentially broken
> that.
>
> Please keep the order as is and only use the new names for
> the newly added models (so for APU6 I believe).


Hi, I'm not sure what the "correct" thing to do is, but just to add some background to the situation:

There are an increasing number of APU boards, which are *very* similar, and also through time the
pin allocations have muddled around, plus most recently, the BIOS can configure many things and has
started to use naming conventions different to the historic kernel naming

So I don't have a board in front of me to be definitive, but something like the following happened:

- APU2 used something like mpcie sockets 1&2 for USB stuff and hence LTE cards, socket 3 was msata

- Then another version APU3, I think moved these to sockets 2&3

- Then another version APU4, moved the USB to sockets 2&3 and wired up a second SIM slot in most
versions, including a SIM line swapper chip. Now you start to wonder if you should have labelled
things PCIE1, PCIE2, PCIE3, etc, when really they mean modem 1 and modem 2, etc?

- Then came APU5, which has 3x USB sockets, plus 3x mpcie sockets. These are wired to different pcie
numbers, and so the naming modem1, modem2, modem3 starts to make a lot more sense.

- APU6, which is mentioned in the original patch, is really just the same as one of the other
boards, but with different ethernet sockets (SFP vs copper)


- There is also a rare feature, which is likely not known to most users, or even wired up correctly
on many boards. You have a reset/enable line to some of the mpcie slots. This again makes more sense
to label logically vs than per slot. It's really not clear that this feature is properly supported
or functioning on all boards (you can order special order boards wired in various ways). So changes
here are unlikely to be noticed by all but a handful of specialist users.


Overall, if one could start again, the unifying feature would be label slots logically, ie modem1,
modem2, wifi1, wifi2, rather than numbering them based on how they are wired on a specific board rev.

Additionally, users who didn't load the APU driver, likely had ACPI named devices and these all have
different (and to my eye, more logical names). So whatever we decide to do here will cause some
breakage and inconsistency...


Note that I submitted this previous patch "years ago", and I've somewhat given up on ever getting
the APU driver up to date.. I think in 2020, Enrico shot me down because he was working on some
grand unification for modem GPIO handling? (Enrico, please correct me on the details?) Hans, I think
if you search back to 2020 on "APU", you will see that you arbitrated in that thread? For whatever
reason, we seem to be stuck that there are competing voices blocking progress here. Every route
leads to some level of incompatibility. Personally I am a fairly large consumer of these devices,
but I really don't care what we decide, because we ship a custom software, where userspace will
match kernel, so we will update both in lockstep, whatever happens. Changes aren't a problem for me
personally.

My vote would be for a one-of breakage, to at least get everyone using the same
terms/names/whatever. I would suspect OpenWRT is probably the biggest voice here, so suggest we go
with whatever they suggest, and then at least we are all in sync for the future? If its a one off,
then suggest taking into account the ACPI naming as well?

Note, there is a very big risk that I missed the point... Please be gentle. Quite possibly there is
a solution to just reorder some definitions and we land where we want to be? Is it that simple?


Hopefully the above helps understanding the bigger picture?

All the best

Ed W

