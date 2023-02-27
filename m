Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFAAC64ED8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Feb 2023 13:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjB0Ns4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjB0Nsw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Feb 2023 08:48:52 -0500
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com [91.220.24.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABDA91;
        Mon, 27 Feb 2023 05:48:48 -0800 (PST)
Received: from [192.168.8.188] (unknown [94.228.36.46])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
        (No client certificate requested)
        (Authenticated sender: ed@wildgooses.com)
        by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4PQMJC2klvzTgS1;
        Mon, 27 Feb 2023 13:47:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
        s=dkim; t=1677505660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=StTvi2lBY7Yfbyh4JtZMEN4y3jbf+2q9vxW9wr3dEcM=;
        b=ABA1Ian8dNCndXCBGHKNasENTOTi8dwCM+nM7USwP179JivHHrs/L1y7mtZCZODlvBHpbB
        vfNuudNxWWLxJ42nSsrsEu7j6+13DwynIwAC/Rk4RZh9yHIQ8ENe0NnFrZ6GLcPJocyhd1
        IZKTS9KxGsRvpi21ggwarVc5JyXjxiI=
Message-ID: <b1b18104-897f-d428-931e-12d2d61252b9@wildgooses.com>
Date:   Mon, 27 Feb 2023 13:48:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/1] x86: Support APU5 in PCEngines platform driver
Content-Language: en-GB
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        Enrico Weigelt <info@metux.net>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230102065447.3447284-1-philipp@redfish-solutions.com>
 <01dbd065-693b-e5fe-5aaf-d74971d6fe7d@redhat.com>
 <AA8BB3C5-8101-4DE2-8FE2-87EBF5329BA3@redfish-solutions.com>
 <670ac95d-cf00-d589-5779-ae754fffd921@metux.net>
 <64B23D00-A81F-4CCA-80A3-9AC58A12E09E@redfish-solutions.com>
From:   Ed W <lists@wildgooses.com>
In-Reply-To: <64B23D00-A81F-4CCA-80A3-9AC58A12E09E@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Excellent! I was just trying to pull together something similar based on =
the individual schematic
documents!

I think this supports the proposal on the table already, that we should p=
refer naming to be "modem
orientated", rather than "pcie slot" orientated.

For example, on APU2, the PE3/4_RST lines are wired to PCIe slots 1 & 2 (=
which are the two with USB)
But on APU4, the PE3_RST reset, USB and SIM lines move from slot 1 to slo=
t 3.

So on APU4, you don't get the control over wireless disable (and reset is=
 hazy) on the mpcie slot 1
for the wifi card. But in all cases the use of the reset/enable lines fol=
low the modem slots, not
the wifi slots

So I maintain my proposal that it's far better to name the GPIOs relative=
 to the USB & modem slots,
since this is how they are being used on ALL schematics. Especially on AP=
U5 (which is the oddball,
having 3x modems + 6x SIMs), this is very much the case

(Also, Enrico, you should beware that your current use might not be worki=
ng as you expect, because I
don't see that you have control over the wifi card enable on APU4 at all?=
)

If we are now in agreement, perhaps we can proceed? I think if we make pr=
ogress here, then I might
also send in a patch to wire up all the other GPIOs.

Thanks all

Ed W


On 27/02/2023 00:22, Philip Prindeville wrote:
> Hi,
>
> I wanted to get the documentation straight from the proverbial horse's =
mouth, before I added any confusion of my own to the conversation.  I rea=
ched out to Pascal and he was good enough to share this document with me.=

>
> -Philip
>
>
>
>
>> On Feb 17, 2023, at 5:20 AM, Enrico Weigelt, metux IT consult <lkml@me=
tux.net> wrote:
>>
>> On 14.01.23 00:04, Philip Prindeville wrote:
>>
>> Hello friends,
>>
>> sorry for being so late, busy with totally different things ...
>>
>>> My read of Enrico's comments were that using ACPI information to map
>>> the GPIO lines would break backward compatibility.  This part of the
>>> effort was dropped.
>> Yes, the big problem is inconsistent support in different firmware ver=
sions in the field. Older version generally don't have any acpi
>> entries at all, later added it (but inconsitent and incomplete) and wa=
s
>> dropped again later (haven't checked whether they reintroduced it
>> again).
>>
>> Obviously, we can't expect users in the field to upgrade firmware and
>> kernel in lockstep. So, we can only rely on this data for those boards=

>> where we can be sure that all shipped firmware versions have proper
>> support (that really does it right). The problem also goes a bit deepe=
r:
>> just adding the GPIOs isn't really enough, they need proper (and
>> consistent) names as well as mapping to the correct drivers (eg. LEDs)=
=2E
>>
>> Oh, BTW, don't arbitrarily change gpio line names (at least for the
>> already mainline-supported boards) - they're are used in the field.
>> (well, I'm not actually satisfied with direct gpio access or things
>> like modem reset lines, but haven't seen an actually fitting subsys
>> for those).
>>
>>
>> --mtx
>>
>> --=20
>> ---
>> Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6r=
t und manipuliert
>> werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihr=
en
>> GPG/PGP-Schl=C3=BCssel zu.
>> ---
>> Enrico Weigelt, metux IT consult
>> Free software and Linux embedded engineering
>> info@metux.net -- +49-151-27565287


