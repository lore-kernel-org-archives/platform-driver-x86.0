Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBA4C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 16:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjAWQMw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 11:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjAWQMu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 11:12:50 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D80A273
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 08:12:48 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id p25so13616412ljn.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 08:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4foejrV3w6bhSS7N78Kjh7UhlsSSYWV1HXlJux6efs=;
        b=V9IJm7w8TK3ohV2orkpjHMplHaxpDnRzLVmrsNFbizAcquT8n/wImuJi0G4EooWjZa
         ASRvxrP00tiDGdoi0IXnkwfYHTEDoQmummAXy7CK7ukZnAYhlnv2wumJ9DBSEB9xLBHu
         mUpelQkQ3PhYqvhtEoTUQ7Zcyie+y4+lA9bcRyCT06pF5BFNZ3MAgb86MFwyKqBgZbja
         EbgjQT97LbugsIWhyCzgWnifSI5flhR0AK4BLHBtNQN1ZJL19WdRYLBMXfy1YXgvYnCU
         WZIMTDTkh5h8XPIhn4mT5DMU2ayp/N7daS/Ci1Gj82bhD7b0hF1DmPKhwM9hiTOi/3l8
         JOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4foejrV3w6bhSS7N78Kjh7UhlsSSYWV1HXlJux6efs=;
        b=OrLxWa9M+lf1Tfm2VuOTli6cAf++Ze5WfpOu+w45WBA0PQAGW3wXYO3dDwQ0g6WGUT
         hImXyh1QmluqWt9KolkXO5ZefKOUhru7kxLdOkjet/SKgU0O6DJObvshkUYDT7u+DFOH
         ddjlj6YyENq0UQZeOKXjwT0y8/h68EVU9d4VAGmw/iXLUNBFuK7W1K5x/z/cw8GA6iJH
         x5lJHi906lfZdO67lKY3VQ9WtwjsgGLmU8AUjQRDbQmPMNQxDLcD95RccARCr7F62Y3w
         ClXpC76j7lVYnem/zXgDPnU6/X7Umu70ghTCEXWcKCFfZx9qM53hdXF650dpSEL65bSR
         mgtg==
X-Gm-Message-State: AFqh2komA5chhtjxecND6a41FtpWU5iOHiJXkWGP30CGjc168B5XVF7O
        Iod5oMeWYd7+MIhNcNdMev1A6ywPwO4AUE7VjyI=
X-Google-Smtp-Source: AMrXdXuviCXjSubvuZbBAK8GNee6V4W1EGNIUun6f+zeteU9amfK5liopNF8Nrbl5y4y9bVR3d6uJ7KiEvs4jeDm0eM=
X-Received: by 2002:a2e:8014:0:b0:27a:26ce:5abd with SMTP id
 j20-20020a2e8014000000b0027a26ce5abdmr2384479ljg.319.1674490367024; Mon, 23
 Jan 2023 08:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20221202173616.180108-1-jorge.lopez2@hp.com> <20221202173616.180108-2-jorge.lopez2@hp.com>
 <f797db3d-feaf-5c03-428e-595ec5f4e3a3@redhat.com> <CAOOmCE--Prhn0xbGgcJyUkwESO6nE-R4NVarY0nvzRmWTr+qnA@mail.gmail.com>
 <81f095db-4ca1-4baa-bee4-0ae52457e54b@app.fastmail.com>
In-Reply-To: <81f095db-4ca1-4baa-bee4-0ae52457e54b@app.fastmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 23 Jan 2023 10:12:35 -0600
Message-ID: <CAOOmCE_bHLrq2Hd7RA9PYOdwJhgsJB-asgoadLiEC6D7NMOG1Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] Introduction of HP-BIOSCFG driver (1)
To:     Mark Pearson <mpearson@squebb.ca>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On Fri, Jan 20, 2023 at 10:07 PM Mark Pearson <mpearson@squebb.ca> wrote:
>
> Hi Jorge,
>
> On Fri, Jan 20, 2023, at 4:58 PM, Jorge Lopez wrote:
>
> Hi Hans,
>
> <snip>
>
>
> Yes. The handling of auth-tokens/CMSL-payloads vs regular passwords
> are similar with the exception of their size.
> auth-tokens/CMSL-payloads are in the size larger than 64 bytes while
> passwords are limited to 64 bytes.
> >
> > Except for the BEAM_PREFIX thing, which can be added to calculate_secur=
ity_buffer() /
> > populate_security_buffer() too and in that case all 3 of the following =
should simply
> > work, taking a boot-delay integer attribute as example:
> >
> > echo "password" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Pass=
word"/current_password
> > echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-dela=
y/current_value
> >
> > echo "auth-token" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Pa=
ssword"/current_password
> > echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-dela=
y/current_value
> >
> > cat csml-payload.file > /sys/class/firmware-attributes/hp-bioscfg/"Setu=
p Password"/current_password
> > echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-dela=
y/current_value
>
> Last two cases cannot be handled by passing auth-token/CMSL payloads
> values to the current password due to their possible sizes.
> Passwords are limited to 64 bytes in size while
> auth-tokens/CFML-payloads are in the size larger than 64 bytes
> Here are examples of CMSL flow for your records.  Most of generated
> payloads are stored remotely and signed by customer to ensure the data
> integrity.   The full benefit of this process is better represented
> when configuring Security settings in BIOS. (Sure Run, Sure Start,
> Sure Recovery, etc)
> .
> 1. Customer generates a signed CMSL payload to set BIOS "USB Storage
> Boot" value to "Enable"
>
> CMSL command:
>
> New-HPSureAdminBIOSSettingValuePayload -Name "USB Storage Boot" -Value
> "Enable" -SigningKeyFile sk.pfx -SigningKeyPassword test
>
> Generated payload:
>
> {"timestamp":"2022-09-26T16:01:22.7887948-05:00","purpose":"hp:sureadmin:=
biossetting","Data":[123,10,32,32,34,78,97,109,101,34,58,32,34,85,83,66,32,=
83,116,111,114,97,103,101,32,66,111,111,116,34,44,10,32,32,34,86,97,108,117=
,101,34,58,32,34,69,110,97,98,108,101,34,44,10,32,32,34,65,117,116,104,83,1=
16,114,105,110,103,34,58,32,34,60,66,69,65,77,47,62,65,83,65,65,68,65,65,65=
,73,120,77,121,89,119,72,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47=
,47,47,47,47,68,85,78,87,111,74,67,117,122,51,73,69,71,57,75,51,80,113,107,=
103,121,76,52,108,100,119,83,67,79,69,65,83,47,98,108,68,122,111,116,47,105=
,77,43,86,103,122,90,77,69,116,43,48,75,87,75,78,103,119,89,99,86,102,121,9=
7,70,56,99,104,102,57,85,47,86,82,106,51,52,122,112,53,111,43,85,112,97,119=
,97,116,106,50,74,103,115,97,105,104,113,54,90,53,84,48,101,49,114,56,78,80=
,109,69,105,119,103,113,118,77,51,108,97,86,83,98,116,101,66,112,80,81,88,1=
19,102,66,56,101,105,112,119,120,104,121,67,68,65,85,111,118,69,113,82,51,8=
4,71,79,54,109,101,75,119,71,100,73,104,72,103,102,50,112,72,75,90,50,107,4=
7,66,116,104,97,98,110,115,118,78,77,114,98,74,69,103,76,72,76,121,87,84,11=
9,98,76,74,87,108,101,106,112,71,121,47,70,100,83,105,74,114,101,66,114,81,=
115,114,106,90,113,100,76,75,72,90,71,117,108,52,70,108,43,117,47,72,102,10=
7,48,119,121,81,69,106,121,97,99,51,52,57,105,90,55,97,104,49,72,56,50,85,9=
7,50,49,55,109,74,51,88,56,87,113,80,111,50,86,72,65,85,57,71,102,47,113,10=
7,97,85,101,75,76,84,97,75,87,101,121,122,116,68,109,105,68,98,115,114,47,8=
6,51,51,106,114,101,67,88,65,65,109,120,68,76,73,73,66,103,83,88,79,82,82,1=
17,98,80,53,113,80,78,69,53,67,76,120,104,119,61,61,34,10,125],"Meta1":null=
,"Meta2":null,"Meta3":null,"Meta4":null}
>
>
> The application reads the CMSL payload and sends the command to the
> driver.  The payload is translated to  [BIOS setting], [Value],
> [Password || auth-token]
>
>
> echo "USB Storage
> Boot,Enable,<BEAM/>ASAADAAANZ9AYwH/////////////////////64bPg7ygUv4xanoHIF=
rzME9mIsxeJh32fkhR7sgHpXdEHjetMXxNVhEK/twhhXhHS93kp9JpGhsr+J6AMKV2ldE99iJHo=
6ul1IxJQuBSxBoN1mf49Mm/ROCNll+IhsAn4ow+xlDwKQn2EzKtQc2Wf1eC646KPcl+ZCtiFhvL=
zXZrGSXsB2hJy0+IzegUPzLY6jaN0lYyQMtQ0KpcyGnK6xZSKCKfotygWawWY8BD3oewyrVLdKM=
GjrtX4HtHaeo5A9VVXVt89i7lZAmV3VkRtu70LEv240ue/SOhwrxGtydgNmtpV3dSn/ancnY4ON=
bTxBRiw8cifObEiNOidYzhpQ=3D=3D"
> > /sys/class/firmware-attributes/hp-bioscfg/attributes/Sure_Admin/setting=
s'
>
> As you can see, the auth-token  "<BEAN/>.....=3D=3D" portion varies in
> size depending on the signing certificate size used.
>
> A method that can be used to address your comments and allow the
> driver to handle both auth-tokens and password using command
>
>        echo "auth-token" >
> /sys/class/firmware-attributes/hp-bioscfg/"Setup
> Password"/current_password
>
> is adding an modifier to indicate if the input is a password or auth-toke=
n
>
> For instance...  using [Token] modifier to identify the data is an
> authentication token
>
>      echo "[token] auth-token" >
> /sys/class/firmware-attributes/hp-bioscfg/"Setup
> Password"/current_password
>
> If the modifier is missing, the driver will treat the data as a password.
>
> This new method will conform with the firmware class framework and
> provide the flexibility needed for HP solution.
>
> Please advise.
>
> I don't know if this is helpful or not as I've not read your code in any =
detail and was just being nosy whilst skimming the mailing list posts - but=
 I did similar for the Lenovo platforms recently.
> In our case we added a 'signature' sysfs entry under authentication/Admin=
 that is used for what is (I think) the equivalent of 'auth-token' when cer=
tificate based authentication is enabled. We didn't try to re-use the passw=
ord entry.
>
> So if certificate authentication is enabled the user ends up doing:
>     echo "crypto-string" > authentication/Admin/signature
>     echo "value" > attribute/"setting"
> and if password authentication is enabled
>     echo "password" > authentication/Admin/password
>     echo "value" > attribute/"setting"
> and the thinklmi driver takes care of figuring out the rest to pass as WM=
I calls to the BIOS (for us this is done at init time and is only changed b=
y a reboot). Note for completeness - we have a signature and a save_signatu=
re....for reasons of BIOS (sigh).
>
Thank you for your suggestion.   Separating 'password' and signature
is a better approach and easier to implement since most of the
supporting code is already implemented.

> I'd also suggest that anything password/authentication related should go =
under the authentication directory to be consistent. This is what is in the=
 sysfs-class-firmware-attributes document :)
>
Yes.  SPM (auth-token), 'Setup Password' (admin), and 'Power On
password' are listed under 'authentication' directory
> Mark
