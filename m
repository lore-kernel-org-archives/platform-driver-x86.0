Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B290C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 18:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240548AbiKQS1G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235041AbiKQS0v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 13:26:51 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D168514D
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 10:26:49 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E1C213201B99;
        Thu, 17 Nov 2022 13:26:45 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute4.internal (MEProxy); Thu, 17 Nov 2022 13:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1668709605; x=
        1668796005; bh=tMPoliM4yDmDhiELiEEmXmd8iLvQa8ia5XXAiZC3Epc=; b=P
        oYP86upO5qNHh3ZHwkOro4KkoHK83bd9xQVvyJGg32Fv57Dlpvey1s91KBeOZ3md
        prXkLulHTv8BiZB+Ut+560mfIlO6xak1VeYmMwc+crrBI0UtbcK3oE++UsNqSnNW
        A5EKj6g2KTbBasJgeinJnWBmaahUd2q8BhgZAyEVOLMk6TmFdqyKoo4z9L04XB4y
        mgKm4sjrXq4UaXCuoScCjhXbzTSsJi5eQua8spo5BYkK7OVOBAzp/kWnC1B5SEeU
        VClptQrxUl+Be+7+JaUe4R4OngEVgxR7y46cqQBf/6pWvEVVvJWb1un3c/18IkaH
        ibBF/IzrHaYud+KNJ2ruw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668709605; x=
        1668796005; bh=tMPoliM4yDmDhiELiEEmXmd8iLvQa8ia5XXAiZC3Epc=; b=u
        4M4+u2fWINsvdeTVmjCSF/fQ1oTV++AYYU33vuFtiNM94/TRDUd+SD5yf3AlcIm1
        uD/hcURb6owcUE5hFe019zkMGLJGJRPTLqPQjLC/Ow7YFFgDkQaJuyX4ySuRJJpC
        jcAl3jRvr2LNwumUyXfehGk4SFc6US2m0CrxmgNSVfu1fiDbm0mqN7Zb2S7dtztl
        2jFLKh449MbIdpwQuwVh6uSY1ZqViPIr75oln8aAqGF173A927lXQestX0qzKHcz
        agztFQ9hCKmbpems+ui2oDhQdcG17wnK5ywLr66H+Tm53qm6YfEB5yCmqOCBuhzD
        5/MhMQxVz9gcIIqNqKKtg==
X-ME-Sender: <xms:5Hx2Y-_nfgLBLR1kg6PUqRO0Dsf9KU2Y4zhfdm4iR9pETpA8k02woA>
    <xme:5Hx2Y-uWs25PmoUTfoYhfIWmw-CLi2Pi5K_3rtJ2fQNm8gmSVNOJGGsrnJd5jtVWI
    6OVE_dM4uVmOxsEpe4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:5Hx2Y0C8El4Neq8bUZROVnt-ntyrgacbkNo00NY_iXyVw8Q2H-VAGg>
    <xmx:5Hx2Y2cT_zJCLTz8CMscsfqyeb8CR-VbWoCvdJG1OTTqoKSu73eW8Q>
    <xmx:5Hx2YzORQVMIa14UN48zq1z79tGnh6WYZ35pSoeUjfrCQlqqkTSxMg>
    <xmx:5Xx2YxsmEztQja015ok5f1Dcqgmcda4p98nQHZz7GrlFFZUBR6L0rA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 72D8636A0073; Thu, 17 Nov 2022 13:26:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <4738204e-303a-4280-9644-1d5f69155637@app.fastmail.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
References: <20221117110244.67811-1-hdegoede@redhat.com>
Date:   Thu, 17 Nov 2022 18:26:24 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Hans de Goede" <hdegoede@redhat.com>,
        "Mark Gross" <markgross@kernel.org>,
        "Andy Shevchenko" <andy@kernel.org>
Cc:     =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        "Kai Heng Feng" <kai.heng.feng@canonical.com>,
        "Maxim Mikityanskiy" <maxtram95@gmail.com>,
        "GOESSEL Guillaume" <g_goessel@outlook.com>,
        "Manyi Li" <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>,
        "Philipp Jungkamp" <p.jungkamp@gmx.net>,
        "Arnav Rawat" <arnavr3@illinois.edu>,
        "Kelly Anderson" <kelly@xilka.com>, "Meng Dong" <whenov@gmail.com>,
        "Felix Eckhofer" <felix@eckhofer.com>,
        "Ike Panhc" <ike.pan@canonical.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] platform/x86: ideapad-laptop: Rework touchpad control code
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



=E5=9C=A82022=E5=B9=B411=E6=9C=8817=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =
=E4=B8=8A=E5=8D=8811:02=EF=BC=8CHans de Goede=E5=86=99=E9=81=93=EF=BC=9A
> Hi All,
>
> Here is v2 of my series to rework the ideapad-laptop touchpad control =
code.
>
> New in v2:
> - Split patch 3/3 in to 3 patches (3-5/6) since it was doing to much a=
t once
>   - Update r_touchpad_val on sysfs read/writes
>   - Drop the write(VPCCMD_W_TOUCHPAD, 1) call at probe in a separate p=
atch
>     and document why this is done in the commit msg
> - Add a new patch (6/6) to hide the touchpad sysfs attribute behind a
>   module-parameter which is disabled by default, see the commit message
>   for why this is done.
>

For the whole series:
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Can confirm this approach works fine on my problematic ideaPad Yoga 14s.

Thanks
- Jiaxun

>
> --=20
> 2.38.1

--=20
- Jiaxun
