Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2ADC05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Jan 2023 21:58:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjATV6q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Jan 2023 16:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjATV6q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 16:58:46 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB71518C8
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 13:58:44 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id w11so6352779lfu.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 13:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQo1GHrym8dLlkWAllxZuWYgJH4ISC80m1GJFOx1rkE=;
        b=O8ku7vsi88ykE9MIez+iGsH6WfWGsT832NzY7Gom7U1bxmwMzpdUHoX2nTSNb7FPKx
         qz4N0ihlW8K7DtVGvz3JivYIDPWbCUXbTj0ZuVsI9Rle4LZgrcfVoFdJsPSERfTLTFRo
         x+bJXquh1vs0TzIbzSTmSCenIXyc0EhD0PQJOy4pTwKlqHdboMQwk0ohSabr3AnAp/70
         Py25L6TdGLJNWhYeJlxBaQD0/Ro0/7blxNqA3nIu3f26DcJtQ/7N23aEbEyj8whbkcRG
         PgZuqyS4BQpZBDQQf5N4opTZ020Vky7mlnQ4vY1fxOmiJy5jPlTe/PrujUEPoN+gs3bZ
         FeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQo1GHrym8dLlkWAllxZuWYgJH4ISC80m1GJFOx1rkE=;
        b=mIZ0fw1+3XOpigT4nLJsN5u/GeFeM86nDTQWrfBNww2AQK4e4aarRvli6K3HDJ9Q6h
         XmCGzbFN9hWWyX24OjcWfRETRcSJoRa2bxXQvSqfipst4kOtS6H0wAMbYp0bnkIsEMPc
         Ejmr0pOY6sH9dJfMcZ1dZohbBCXCVnaNuF6SNLcuoMcYA2tYUfVYA9VHtBvKgZLDqb8I
         B9hBpjMoArx7c+gCjZiqee9f82Ms1OG4qXx8kPkpKXptIIBS39YaFOnYtyvMYhZHUcZ2
         6TtlWQvor6VBvFeATdpRkYzPGSC3Ah2pShVkP01sDJLlEEu9Eiurp1cqlz7zOHoUDF9X
         ktRQ==
X-Gm-Message-State: AFqh2kp6MW7Ox0Qf+KMUqnoSO25YQRnOvGhIznEH1hEk5fcdm+pCDOP3
        u/71T/5iLBgHKI4ZX6dKJvaY2YJvXeyku+GNYIqe2vbzyHU=
X-Google-Smtp-Source: AMrXdXu7OuTQzuA1WgKso63OYlgT99YmqCNAyUkzhSmndsr6MqScKrtaNwObbKKDCCXAD/utnYi8xxqNPuDPIlpn77k=
X-Received: by 2002:a19:e01b:0:b0:4b4:a5b5:1a04 with SMTP id
 x27-20020a19e01b000000b004b4a5b51a04mr770074lfg.142.1674251922443; Fri, 20
 Jan 2023 13:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20221202173616.180108-1-jorge.lopez2@hp.com> <20221202173616.180108-2-jorge.lopez2@hp.com>
 <f797db3d-feaf-5c03-428e-595ec5f4e3a3@redhat.com>
In-Reply-To: <f797db3d-feaf-5c03-428e-595ec5f4e3a3@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Fri, 20 Jan 2023 15:58:30 -0600
Message-ID: <CAOOmCE--Prhn0xbGgcJyUkwESO6nE-R4NVarY0nvzRmWTr+qnA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] Introduction of HP-BIOSCFG driver (1)
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,


>
> > +
> > +             "sure-admin"-type specific properties:
> > +
> > +             settings:
> > +                                     A file associated with Sure Admin=
. BIOS settings can
> > +                                     be read or written through the Su=
re Admin settings file in sysfs.
> > +
> > +                                     [BIOS setting],[new value],[auth =
token]
> > +
> > +                                     Sample settings reported data
> > +
> > +                                     {
> > +                                             "Class": "HPBIOS_BIOSEnum=
eration",
> > +                                             "Name": "USB Storage Boot=
",
> > +                                             "Path": "\\Advanced\\Boot=
 Options",
> > +                                             "IsReadOnly": 0,
> > +                                             ...
> > +                                             "Value": "Enable",
> > +                                             "Size": 2,
> > +                                             "PossibleValues": [
> > +                                                     "Disable",
> > +                                                     "Enable"
> > +                                                     ]
> > +                                     }
> > +
> > +                                     This file can also be written to =
in order to update
> > +                                     the value sof a <attr> using a CM=
SL generated payload.
> > +                                     For example:
> > +
> > +                                     <attr>,[value],[CMSL generated pa=
yload]
>
>
> This is basically a run-around around the actual firmware attributes API,
> so NACK for this.
>
> Looking at how sure_admin_settings_write() encodes things I don't see any
> difference between how auth-tokens/CFML-payloads are handled vs regular p=
asswords
> inside hp_set_attribute().

Yes. The handling of auth-tokens/CMSL-payloads vs regular passwords
are similar with the exception of their size.
auth-tokens/CMSL-payloads are in the size larger than 64 bytes while
passwords are limited to 64 bytes.
>
> Except for the BEAM_PREFIX thing, which can be added to calculate_securit=
y_buffer() /
> populate_security_buffer() too and in that case all 3 of the following sh=
ould simply
> work, taking a boot-delay integer attribute as example:
>
> echo "password" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Passwo=
rd"/current_password
> echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-delay/=
current_value
>
> echo "auth-token" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Pass=
word"/current_password
> echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-delay/=
current_value
>
> cat csml-payload.file > /sys/class/firmware-attributes/hp-bioscfg/"Setup =
Password"/current_password
> echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-delay/=
current_value

Last two cases cannot be handled by passing auth-token/CMSL payloads
values to the current password due to their possible sizes.
Passwords are limited to 64 bytes in size while
auth-tokens/CFML-payloads are in the size larger than 64 bytes
Here are examples of CMSL flow for your records.  Most of generated
payloads are stored remotely and signed by customer to ensure the data
integrity.   The full benefit of this process is better represented
when configuring Security settings in BIOS. (Sure Run, Sure Start,
Sure Recovery, etc)
.
1. Customer generates a signed CMSL payload to set BIOS "USB Storage
Boot" value to "Enable"

CMSL command:

New-HPSureAdminBIOSSettingValuePayload -Name "USB Storage Boot" -Value
"Enable" -SigningKeyFile sk.pfx -SigningKeyPassword test

Generated payload:

{"timestamp":"2022-09-26T16:01:22.7887948-05:00","purpose":"hp:sureadmin:bi=
ossetting","Data":[123,10,32,32,34,78,97,109,101,34,58,32,34,85,83,66,32,83=
,116,111,114,97,103,101,32,66,111,111,116,34,44,10,32,32,34,86,97,108,117,1=
01,34,58,32,34,69,110,97,98,108,101,34,44,10,32,32,34,65,117,116,104,83,116=
,114,105,110,103,34,58,32,34,60,66,69,65,77,47,62,65,83,65,65,68,65,65,65,7=
3,120,77,121,89,119,72,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,47,4=
7,47,47,47,68,85,78,87,111,74,67,117,122,51,73,69,71,57,75,51,80,113,107,10=
3,121,76,52,108,100,119,83,67,79,69,65,83,47,98,108,68,122,111,116,47,105,7=
7,43,86,103,122,90,77,69,116,43,48,75,87,75,78,103,119,89,99,86,102,121,97,=
70,56,99,104,102,57,85,47,86,82,106,51,52,122,112,53,111,43,85,112,97,119,9=
7,116,106,50,74,103,115,97,105,104,113,54,90,53,84,48,101,49,114,56,78,80,1=
09,69,105,119,103,113,118,77,51,108,97,86,83,98,116,101,66,112,80,81,88,119=
,102,66,56,101,105,112,119,120,104,121,67,68,65,85,111,118,69,113,82,51,84,=
71,79,54,109,101,75,119,71,100,73,104,72,103,102,50,112,72,75,90,50,107,47,=
66,116,104,97,98,110,115,118,78,77,114,98,74,69,103,76,72,76,121,87,84,119,=
98,76,74,87,108,101,106,112,71,121,47,70,100,83,105,74,114,101,66,114,81,11=
5,114,106,90,113,100,76,75,72,90,71,117,108,52,70,108,43,117,47,72,102,107,=
48,119,121,81,69,106,121,97,99,51,52,57,105,90,55,97,104,49,72,56,50,85,97,=
50,49,55,109,74,51,88,56,87,113,80,111,50,86,72,65,85,57,71,102,47,113,107,=
97,85,101,75,76,84,97,75,87,101,121,122,116,68,109,105,68,98,115,114,47,86,=
51,51,106,114,101,67,88,65,65,109,120,68,76,73,73,66,103,83,88,79,82,82,117=
,98,80,53,113,80,78,69,53,67,76,120,104,119,61,61,34,10,125],"Meta1":null,"=
Meta2":null,"Meta3":null,"Meta4":null}


The application reads the CMSL payload and sends the command to the
driver.  The payload is translated to  [BIOS setting], [Value],
[Password || auth-token]


echo "USB Storage
Boot,Enable,<BEAM/>ASAADAAANZ9AYwH/////////////////////64bPg7ygUv4xanoHIFrz=
ME9mIsxeJh32fkhR7sgHpXdEHjetMXxNVhEK/twhhXhHS93kp9JpGhsr+J6AMKV2ldE99iJHo6u=
l1IxJQuBSxBoN1mf49Mm/ROCNll+IhsAn4ow+xlDwKQn2EzKtQc2Wf1eC646KPcl+ZCtiFhvLzX=
ZrGSXsB2hJy0+IzegUPzLY6jaN0lYyQMtQ0KpcyGnK6xZSKCKfotygWawWY8BD3oewyrVLdKMGj=
rtX4HtHaeo5A9VVXVt89i7lZAmV3VkRtu70LEv240ue/SOhwrxGtydgNmtpV3dSn/ancnY4ONbT=
xBRiw8cifObEiNOidYzhpQ=3D=3D"
> /sys/class/firmware-attributes/hp-bioscfg/attributes/Sure_Admin/settings'

As you can see, the auth-token  "<BEAN/>.....=3D=3D" portion varies in
size depending on the signing certificate size used.

A method that can be used to address your comments and allow the
driver to handle both auth-tokens and password using command

       echo "auth-token" >
/sys/class/firmware-attributes/hp-bioscfg/"Setup
Password"/current_password

is adding an modifier to indicate if the input is a password or auth-token

For instance...  using [Token] modifier to identify the data is an
authentication token

     echo "[token] auth-token" >
/sys/class/firmware-attributes/hp-bioscfg/"Setup
Password"/current_password

If the modifier is missing, the driver will treat the data as a password.

This new method will conform with the firmware class framework and
provide the flexibility needed for HP solution.

Please advise.

>
> The only reason why this would not work is if things may get bigger then =
the size of a single
> memory page (bigger then 4096 bytes).
>
> But in that case you should just change the code implementing current_pas=
sword to
> use the bin_attribute interface and replace the static buffer for storing=
 it
> with a pointer to kmalloc-ed memory, which is NULL when the password is n=
ot set.
>
> This will also remove a lot of finicky parsing which is currently done in=
side
> sure_admin_settings_write()
>
> ###
>
> As for the reading which returns a large large list of data blocks like t=
his:
>
>                                         {
>                                                 "Class": "HPBIOS_BIOSEnum=
eration",
>                                                 "Name": "USB Storage Boot=
",
>                                                 "Path": "\\Advanced\\Boot=
 Options",
>                                                 "IsReadOnly": 0,
>                                                 ...
>                                                 "Value": "Enable",
>                                                 "Size": 2,
>                                                 "PossibleValues": [
>                                                         "Disable",
>                                                         "Enable"
>                                                         ]
>                                         }
>
> This sort of thing really does not belong in the kernel.

I concur with your statement and behavior will be removed from driver code.
