Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0E7C46467
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 16:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbjAKQlk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 11:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236589AbjAKQlR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 11:41:17 -0500
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3035F4F
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 08:39:21 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 027E93200925;
        Wed, 11 Jan 2023 11:39:18 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Wed, 11 Jan 2023 11:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1673455158; x=
        1673541558; bh=I5E/yhNJ6DAQZQgnZxmWUuLEFVvA0Cf93z1Bp6F67TY=; b=V
        2oP4ZJ5fw8ZUtszDS48t5LoAaiIAjG/Ecqvrf6plbNmukF1TdFXJdd9rAMn5Ru7T
        120G6NfGNtK8V1IHBhX4w+wCu3VMaJ/4zgTgiWTHUA2qDLT7FgEiIpErlE88B9sQ
        T9DjMvWmB868y5iki5s+VfkIgmkmiVgKU1i0P96h8CDcBpkb9ELqCHmrY0k1bD2M
        h3BULNlxaxC5lHvAI0e7SFknSU16bAoqA0t4Kwx0jFs4mEJfDWWZwjUdFYFqinbG
        mmftzOceS0GiRIACtWLY7HATlhNoJVQ9yHOYov4fa00mvwAqvRM+NHdJDII1DbV+
        Yyb63CTj+IlLMryDlIlDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673455158; x=
        1673541558; bh=I5E/yhNJ6DAQZQgnZxmWUuLEFVvA0Cf93z1Bp6F67TY=; b=k
        dQw47PMXsW/rMUx1naNZlAeWkNj/G+TYR8/sNdaA5Bb+2qP8iWfXC5Ro94Bvh5lr
        OWiEVjxyQFd2viQ2ouAD3QLO+avYSEWC1VFgHNVyLe+kP3PcSDZEf2rQSGJw/t52
        CDI/X/W2b18O8gtj17tch4X/tXz/48fBEHKU7J8j7dLMttfVYxnC3SUISR1CKWej
        7sSW2MVh7riaQBHpCiP0cPPdZ/WkMB1GeuAGHlEFRneB0aMx4I286YcNumNgDNNA
        3iH9fxvM4uTVfPsF6Dyf8I9m6Uc9a6exvsWvYU10UEYca47a4N3boPwqGzNvegz2
        2lwbArfqhlh6XFZQrRmCQ==
X-ME-Sender: <xms:Nea-Y7-jYr_SHZSeyMxYcwbDhPvE363_Pq4kHwZ9f9JpLmyJquQK0g>
    <xme:Nea-Y3tuJ_oPmCzNoPO6FZgfLyJEnjtKekQOcTyFImsZoaKaAYG62NYkHsQDPHBR2
    K__R6IK3yqe4SD6PAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeggdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Nea-Y5Dk0GowKSlfx1htBdQAAp4PZt1bdv0StRv6ncwvQwVHgKq-5A>
    <xmx:Nea-Y3cd7gE2a7SocVegL1GxeuKkfR2A1WAu2LsZpfWuaU-w2Hje1w>
    <xmx:Nea-YwM601gg6-NVf89oVZFDYE8FXqOq-I9B5BCe9yqNLFUmdzloiA>
    <xmx:Nua-Y_3EI0oAWLDCdEQUj3f5f18zzbWagUV7m1JI52-8fMYgFcwRRA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D874736A0073; Wed, 11 Jan 2023 11:39:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <a4cd28eb-2dc3-4cdc-bea4-5abed60ae108@app.fastmail.com>
In-Reply-To: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
Date:   Wed, 11 Jan 2023 16:38:24 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Hans de Goede" <hdegoede@redhat.com>,
        "Maxim Mikityanskiy" <maxtram95@gmail.com>,
        "GOESSEL Guillaume" <g_goessel@outlook.com>,
        "Matthew Garrett" <mjg59@srcf.ucam.org>,
        "Manyi Li" <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>,
        "Ike Panhc" <ike.pan@canonical.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



=E5=9C=A82022=E5=B9=B411=E6=9C=889=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =E4=
=B8=8B=E5=8D=888:59=EF=BC=8CHans de Goede=E5=86=99=E9=81=93=EF=BC=9A
> Hi All,
>
> I'm emailing you all because you have written patches or
> reported bugs related to the ideapad-laptop touchpad
> handling the past.

Hi all,

Sorry for chime in this old thread, but I'm able to get some input from a
Lenovo engineer.

Quoting him:

"For newer Lenovo laptops we use TPRD/TPWR methods under touchpad's ACPI=
 I2C HID
device to sync touchpad state with EC. TPRD will return current touchpad=
 state known
by EC and OS can use TPWR to switch EC's touchpad state. This state will=
 be used by EC
to control LEDs and touchpad power saving signals."

According to my understanding we only need replace read write to VPCCMD_=
R_TOUCHPAD
with calling TPRD/TPWR methods to get all new ideapads work.

As per my reverse engineering on ASLs this method actually reads a flag =
from EC's
LPC memory space and it do work on some early ideapads (The earliest one=
 I can
trace is Ideapad 320-15ISK which is released on 2018).

I'm going to try to implement it in kernel. Though I haven't decide whic=
h part of
driver should handle this, as those methods are under ACPI I2C HID devic=
e perhaps
we should put this function under i2c-hid-acpi driver. However as the me=
thod is very
ideated specific, putting in ideapad-acpi seems more reasonable... Any t=
houghts?

He also told me how to get VPC2004 device's BIOS interface version, thou=
gh the
differences between versions remains unclear to me. I think we can expos=
e it
in dmesg and debugfs to help with future debugging and hopefully reduce =
the amount
of DMI quirks.

Thanks.

--=20
- Jiaxun
