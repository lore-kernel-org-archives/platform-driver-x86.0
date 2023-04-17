Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14CCC77B7F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Apr 2023 13:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjDQNSM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Apr 2023 09:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjDQNSK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Apr 2023 09:18:10 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C04103
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Apr 2023 06:18:09 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id BD2D85C00CC;
        Mon, 17 Apr 2023 09:18:06 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Mon, 17 Apr 2023 09:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1681737486; x=1681823886; bh=kM
        JGpBuonkMLnZjY9btsMO4QW6umWIuu242wMOQ4bwU=; b=X2gbRd7OMOEFkiqxCL
        KmazF4/UmvnKoQAm3jCyJ30yXeG+JLefLNmT7/A8kaXECnbPAHM4INrxHvtZXB8y
        gVa+IZs/JU4vKQD26+B1M1O6vAEWWF2Y4iaA6DMZssuunuh03ZRlFMcNE9oeKcZ8
        gBhuH2GBaeB3hScS5ZTfJis9ccA2iZ3q1tw13p96BVd5kfaR7gg5v516pOhyn0JQ
        aS8+TW/6sh5f3MZQIJxI5/udHvzbqXKRGIhz5+quBjl6UqqhPWnXzBMOwEtlU9J/
        heGbIfKZq7SpvHl4RCIOB8S/gv2xW1/mlF3Li/5t4PMn0EAKjq7ZyxiaXQ3MgjUB
        o2RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681737486; x=1681823886; bh=kMJGpBuonkMLn
        ZjY9btsMO4QW6umWIuu242wMOQ4bwU=; b=EPt5DDcDdcgW+YFCqHF1GbXLdCoi/
        YbDCWLoSf6yiv1RGeX6AH6d4ATKh6uq1j7vry/OpHG9XIJUNiuXVTla8Y2V84qRl
        EN2VqUJezpiB+hIQokoNerOWDwC9w+ghkLpM5RWKQV/vWXVyww4smQ1nlYM4oHgm
        2PhdeqDw19CW6AhKQ5oAAHlZeTkF/y7yEN0HGt1HPmSqy0GeVlA/Ns3YgWzrzndG
        mIr9Fj4tiliEUgUXhKh45D62V6hkEdO8xDEytaeUzUGNsdQcmXLDCfn+X0maxrVQ
        LvL6077v1wL0oR6Y4arplazrbe/jLFxzelfYzHEFWNd7nREc7MjTTS6xw==
X-ME-Sender: <xms:Dkc9ZME-glHzY50qkzxbfjACvsYEMfrhnEVDzdjHRuhx63l5MtuKPg>
    <xme:Dkc9ZFU6uDj3FdG2kZdVygRvh-h3BfJAgP8UOGu4yDJPRosC0AEWkoZqy_4UnUkF5
    1XKHe4zCt8_l_W78Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeekleeftefgfffgleeljeehhfffheffgfeljefg
    ueeufeejieeigfffueelteelvdenucffohhmrghinheplhhptggsrdgvtgenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:Dkc9ZGKMlR7Ayme-6IydrnwXinEn2LYp80Su3mcGF1LPEa6VknXP3Q>
    <xmx:Dkc9ZOE9CA248tXBaRrnmHX4VnH5u0ErpY8w9RChCvRUey30RSu7TA>
    <xmx:Dkc9ZCVDylmqiG1ZjknL4zVXIC0E3z1Digeol5K76ZsEcVgubXyAQg>
    <xmx:Dkc9ZAzuIVovgw7Bkc7_bQIGAJNyk686nht0bQzSuhkF2z3qXGMnSw>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 296D5C60091; Mon, 17 Apr 2023 09:18:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <bcd8d501-a457-40fb-9b4d-4df118b76d2f@app.fastmail.com>
In-Reply-To: <dd07686f-dd03-4efc-3dfe-5b568c6c854d@redhat.com>
References: <20230414180034.63914-1-dani@danielbertalan.dev>
 <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com>
 <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com>
 <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
 <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev>
 <dd07686f-dd03-4efc-3dfe-5b568c6c854d@redhat.com>
Date:   Mon, 17 Apr 2023 09:17:45 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     "Hans de Goede" <hdegoede@redhat.com>,
        "Daniel Bertalan" <dani@danielbertalan.dev>
Cc:     "Liav Albani" <liavalb@gmail.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller access on
 X380 Yoga
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 17, 2023, at 6:19 AM, Hans de Goede wrote:
> Hi,
>
> On 4/15/23 16:22, Daniel Bertalan wrote:
>> Hi,
>> 
>> On Saturday, April 15th, 2023 at 15:30, Hans de Goede <hdegoede@redhat.com> wrote:
>> 
>>> Hi,
>>>
>>> On 4/15/23 15:24, Liav Albani wrote:
>>>
>>>> On 4/15/23 13:12, Hans de Goede wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 4/14/23 20:02, Daniel Bertalan wrote:
>>>>>
>>>>>> On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
>>>>>> accessing the Embedded Controller: instead of a method that reads from
>>>>>> the EC's memory, `ECRD` is the name of a location in high memory. This
>>>>>> meant that trying to call them would fail with the following message:
>>>>>>
>>>>>> ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
>>>>>> ACPI object (RegionField)
>>>>>>
>>>>>> With this commit, it is now possible to access the EC and read
>>>>>> temperature and fan speed information. Note that while writes to the
>>>>>> HFSP register do go through (as indicated by subsequent reads showing
>>>>>> the new value), the fan does not actually change its speed.
>>>>>>
>>>>>> Signed-off-by: Daniel Bertalan dani@danielbertalan.dev
>>>>>> Interestig, this looks like a pretty clean solution to me.
>>>>
>>>> Daniel and I have looked in the DSDT ASL code and found a bunch of registers in high physical memory location (which is an ACPI OpRegion),
>>>> and one of the registers had a bit called ECRD.
>>>> However, there were many other registers that might be interesting as well, the problem is the short names in the ASL code (so we only see abbreviations essentially).
>>>>
>>>> While I do agree that adding this code is indeed a clean solution, if you (people that are dealing with Thinkpad laptops) know about cleaner way to access the embedded controller, I think it's preferable, because this way Daniel might be able to trigger the fan on that laptop so it will actually spin and will dissipate-out heat from the system, without the relying on the embedded controller to get into some sort of thermal state and then to trigger the fan.
>>>
>>>
>>> Have you tried falling back to the ec_read() and ec_write() helpers
>>> exported by the ACPI EC code ?
>>>
>>> The "first_ec" pointer used by these functions is exported too,
>>> so you could try modifying thinkpad_acpi to use ec_read() and
>>> ec_write() as fallback when first_ec is set (and the quirk
>>> added by this patch triggers).
>> 
>> This is basically what my patch does. If the ECRD/ECWR method handles
>> are NULL, thinkpad_acpi's acpi_ec_{read,write} functions fall back to
>> the regular ACPI EC helpers you mentioned.
>
> Ah I did not realize that. Ok that sounds good to me.
>
> I'll go and apply the patch then. To be on the save side I'm going
> to only add this to -next, so that it gets some testing before
> showing up in stable series. Once 6.4-rc1 is out you can then
> send it to stable@vger.kernel.org to get it backported.
>
>> Speaking of which, does anyone know why these private helper functions
>> exist in the first place? The code seems to use them interchangeably.
>> Even in the fan control code, there are places where the regular EC
>> helpers are called directly. Can we get away with always doing that?
>
> I assume that on some older models there is no standard ACPI EC device
> in the ACPI tables, so there only ECRD/ECWR work. I guess that code-paths
> which directly call ec_read() / ec_write() are only used on newer
> models. But this does indeed seem inconsistent.
>
>> Back to the issue at hand, is there someone we could ask if the X380Y
>> even supports manual fan control in the first place? My debugging
>> efforts are starting to look like a wild goose chase.
>> 
>> The thermal sensors and fan PWM readings now work, which is better
>> than nothing, but it would be good to get to the bottom of this.
>
> Mark Pearson from Lenovo can hopefully help answer this, but I know
> that he is quite busy atm. Hopefully Mark will get back to you when
> he has some more bandwidth.
>

Apologies - I thought I had already replied to thread, but seems I hadn't.

I'm checking with the FW team and will see what I can find out. It may take a little while, especially as this is an older platform and the question is a bit more non-standard than normal.
Internal ticket is LO-2411

Thanks!
Mark
