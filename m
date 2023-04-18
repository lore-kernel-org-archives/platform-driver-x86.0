Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5816DC6FD18
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Apr 2023 13:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbjDRNQz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Apr 2023 09:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjDRNQy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Apr 2023 09:16:54 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B83167E6
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Apr 2023 06:16:49 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6EB2A3200708;
        Tue, 18 Apr 2023 09:16:46 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Tue, 18 Apr 2023 09:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1681823806; x=1681910206; bh=n4
        8ZxjHREqwFiLOHguX2iQ8ILVboMjA6pOPfnP7KCq0=; b=HnzIqov564koHISixI
        rZblQ39NHcOrjZfvf8BI8+5qzM+F8w6S8rDqr9+1fYRXhY2wo0WF4j6CaWLveAT4
        kxhNUWVooook+afVOp1JsKCLSpArTga1Tc8xVJrhxDwLKbxOJ6ZdtxkxnaN1Afn6
        lHzRfPGQ4wpOnEupUqBeeoLd0PSIPaizewme5urXufh2IXjHlK8HBVY2sActMtqw
        ijEUmhBs8uFifZU1eoU+zwVXCM9Wf7zWlOF7DDlQze6E7QHBrWb+prxq7RD2m/l8
        rzAYwfc/X3igQwx3YYsB9jtaSQJbeiyBCXPfmG/B5OfYZJkBvrLKh1RUbYpA/WBW
        4nMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1681823806; x=1681910206; bh=n48ZxjHREqwFi
        LOHguX2iQ8ILVboMjA6pOPfnP7KCq0=; b=fPGao2abRow+OmyCHNParKQ2AWsYc
        53rMfcA4EDXzXG4uS6YHl1IHFKJ73JjSEOJFchdw2dCLOUJ2j65dqEuI04mVAHhR
        51ucUHKUoi5KG1aCHDlQhrQqIlrLTCGq+ysFI7z6mSjqSU0LxmpBC6fDpSNryte2
        pn5MsTtLniTNEW1RN3pxNXgFH8qwgC0sTYjEXkwcJKOeDAUV1/NWv2Zw++GEmJn0
        p12H5a/muVETihA1S1z+h+CPdiszpK4BvVEL13WRhOU2IrNNoDh1Zgt1HqYoc4Qw
        N8JEt9IVyfIq+c88+2S4wgeYDaqilYsdqC4xFDvv3WWm8YJ5cqT3k0G1w==
X-ME-Sender: <xms:PZg-ZC8qfPIsrqPLeVdf5J4EJ7sFZ8oMtXmsjf11OVwcc0AfIvm4_w>
    <xme:PZg-ZCtMDroq5HyBRGDE29THN3WX9Fvo9mOnyfJdk0HPjpUYRk8GnOq4Ov9q3zKMg
    F9ReZTRJoHofy1c7gc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelkedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeekleeftefgfffgleeljeehhfffheffgfeljefg
    ueeufeejieeigfffueelteelvdenucffohhmrghinheplhhptggsrdgvtgenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:PZg-ZIBoiYniRMEVq2GLY4i4fE0Y5r1KdlttERm8vnczR3ZoHXaz9g>
    <xmx:PZg-ZKfqR57mLzz6FuzSUkrGSEJk788QalQxEFqHzgZMwMQzllKX0w>
    <xmx:PZg-ZHO3qGH1V5eQLNZeEQfHyGJCDFt1NZF5kZZpjAbuGCvFq6lc3Q>
    <xmx:Ppg-ZAoQbEJgxOwPzPEe5rZjh6DhXR1fTLnFjDmRS9DzeEYavIAUaA>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4F8A1C60097; Tue, 18 Apr 2023 09:16:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <ca210db5-2a2b-4962-8c28-e9b7d8cf6a59@app.fastmail.com>
In-Reply-To: <TYZPR03MB59945171347BC248412EBEE6BD9D9@TYZPR03MB5994.apcprd03.prod.outlook.com>
References: <20230414180034.63914-1-dani@danielbertalan.dev>
 <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com>
 <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com>
 <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
 <c7LGto3wAWSkvfZaIEtB9_5EhTFe8ZdAOCKSZE8m8L18w0kJu2tms1RSdhrdUPBfHy5f-GMvxi_Etc5s8e7NOdF_xG4atmwco2QQ41bv9Sc=@danielbertalan.dev>
 <dd07686f-dd03-4efc-3dfe-5b568c6c854d@redhat.com>
 <TYZPR03MB59945171347BC248412EBEE6BD9D9@TYZPR03MB5994.apcprd03.prod.outlook.com>
Date:   Tue, 18 Apr 2023 09:16:03 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     "Daniel Bertalan" <dani@danielbertalan.dev>
Cc:     "Liav Albani" <liavalb@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        "Mark Gross >" <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        ">" <ibm-acpi-devel@lists.sourceforge.net>,
        "Henrique de Moraes Holschuh >" <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] platform/x86: thinkpad_acpi: Fix Embedded
 Controller access on X380 Yoga
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Subject: [External] Re: [ibm-acpi-devel] [PATCH] platform/x86: 
> thinkpad_acpi: Fix Embedded Controller access on X380 Yoga
>
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
Sorry for the slow reply on this one.

I checked with the FW team and they confirmed on the x380 Yoga that the implementation is unique and not using the ECRD/WCWR ACPI methods. They didn't say why...but it's not expected to be something done again.

I had missed the question about fan control so didn't ask about that. Is there a reason you need to change the fans? It's generally not recommended as it can violate temperature specs and leads to all sorts of issues.

I don't know if the fact this is a one off makes this a better candidate as a quirk? To reduce the risk of breaking something on other platforms? But the code changes looked sensible to me.

I'll aim to do some builds with it in and test it on a few platforms - but I'm travelling next week so this week (and almost certainly the week after) are a bit hectic.

Thanks
Mark

