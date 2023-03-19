Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0EAC7618A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Mar 2023 00:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjCSAEt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 20:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjCSAEt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 20:04:49 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29BD23DAB
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 17:04:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D642D5C0086;
        Sat, 18 Mar 2023 20:04:44 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Sat, 18 Mar 2023 20:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679184284; x=1679270684; bh=nVC5Ofnupwe4M0pEAB/3o2pKu7xlyU+PTNO
        x6ea8SWc=; b=cZLOw899P4FQw2P3YgqMMkZtRCBsdlrgcY7WzY+1GpKEiPS9n99
        LSmc/YR75yHMcS1B4OpfgeC9wMq2hqD0RN3LcIKbXVVd/1mOqVrQ6kwlpBS77iX5
        nEPjuLJ2wcOIT1lA4HOTnT72kr5i0yoPcR/kaeTMSBXuFFUw+1/LRZeNhLaBaLOV
        KayVGFx9Eyqhz7AkSBrj07rXk80gxTUfuDx6AM5URzp2IVRdDrWx0v1zpKTDuh43
        AI3U8HvArWDvPtsrbgnXpsQa/EyRNf1ptrppn1C1trPPQAX70dGycd2pk/fsQZiR
        h5Lyz+ypJu1L/gYxVLsDWFp8aBu8FoOzjgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679184284; x=1679270684; bh=nVC5Ofnupwe4M0pEAB/3o2pKu7xlyU+PTNO
        x6ea8SWc=; b=CF8mt4DziEvEyM6a46aa6sfZ5NRXO/omrT2tFCqGxz8vO0rW8Fv
        bQ3zDAbzPE+he+ClwISGaDQxvLpcIjeQUplMj+D3Kn7ULA37x8zFdq4fqyn24NLh
        lNKS5pobFEZkrLwxT9Yp7JiSrUq0Ej0sos3QTrZqQpAEwVZyf8VN0EKQg+0IGvt5
        3y0Btn+9Df6V0yags8rnWWXKcC2bqk1m77lI1SA64hmi0I7OjNgLOT0nfFaALUBd
        ekMJ55GpKfjooqrDrkMJVmlWYFDZ8xuA0/QJ2qmggeJ0F6CBh1J7Gpj7HTGkUEV6
        kiCaQe4ZVDh1Fpkt8UK/B4bmU6YJHJbGE7g==
X-ME-Sender: <xms:nFEWZEI-iS9G_jekA7LUxFKVKMhVhVeuzrJlJErk1jj_x7ko7kp6aw>
    <xme:nFEWZELqLHT0p53fLsjI8tbd4vMSBfPnjnDk0IwvWRzngTbKsx14e2S6pUFQucInK
    nk5nnvjxkXZ2QwHhUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefhedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepfeejgedvudegvdekhedvffefjefhuedthfdt
    heehkeffuddvgfetjeegjeeufefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghr
    shhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:nFEWZEtiz_mYrQPmFZFo6Oq032bDTJYjSvAA9hiGV0ysqnxaej-zfA>
    <xmx:nFEWZBaoo5sptNXohh2Nq7hFaMUVUeC9Pw-y9Du82X24686x6QopgQ>
    <xmx:nFEWZLYZPpJjF-_ipkNTKN4AY7NeIqy66B_B1TBqZdHDUiUvouCfTw>
    <xmx:nFEWZKlnEuoKtp2pPLuAF7-Svubkfyws1c3kJJ68R1Kmr_dKO29Xow>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 982B7C60091; Sat, 18 Mar 2023 20:04:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <1c0d8c4d-58e6-4e0f-8d28-339f943e31b5@app.fastmail.com>
In-Reply-To: <faff3b63-5ccd-4b9d-af7a-68568b6ee934@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
 <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
 <7f8a0183-2da6-4ccb-9dd8-3602e67edd5a@app.fastmail.com>
 <faff3b63-5ccd-4b9d-af7a-68568b6ee934@t-8ch.de>
Date:   Sat, 18 Mar 2023 20:04:20 -0400
From:   "Mark Pearson" <mpearson-lenovo@squebb.ca>
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     "Hans de Goede" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mark Pearson" <markpearson@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 18, 2023, at 8:01 PM, Thomas Wei=C3=9Fschuh wrote:
> On Sat, Mar 18, 2023 at 01:59:38PM -0400, Mark Pearson wrote:
>> On Sat, Mar 18, 2023, at 12:35 PM, Thomas Wei=C3=9Fschuh wrote:
>> > Hi Mark,
>> >
>> > please also CC linux-kernel@vger.kernel.org and previous reviewers.
>>=20
>> My apologies on previous reviewers - that was a miss on my behalf
>>=20
>> I've never cc'd linux-kernel previously - is that a requirement? It's
>> new to me if it is - what's the reason? (that mailing list seems
>> unusable to me from my limited experience...)
>
> The wording in Documentation/process/submitting-patches.rst is indeed
> unclear about always Cc'ing linux-kernel.
>
> My arguments for it are:
>
> - People can look at the linux-kernel archives to see what's going on
>   all over the kernel.  (I do that sometimes myself)
>   Also it makes it easier to search on lore.kernel.org on linux-specif=
ic
>   messages/patches. The /all/ archives also contains other projects.
>
> - Some bots are processing proposed patches from mailing lists.
>   These are not subscribed to all subsystem lists.
>
> - The b4 tool does it.
>
> - Greg does it:
>  =20
> https://lore.kernel.org/lkml/20230313182918.1312597-5-gregkh@linuxfoun=
dation.org/
>
> Thomas

All good reasons :) I will start doing that going forwards.=20
Thanks for the clarification.
Mark
