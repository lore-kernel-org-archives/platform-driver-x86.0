Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC84CDB482
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 02:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjJRCF0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 22:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJRCF0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 22:05:26 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B100F7
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 19:05:21 -0700 (PDT)
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 44BBE4061F
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 02:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1697594719;
        bh=ctnR1hv0kXrpmBCToO6pQzJRW4HEzDKrT4MMMQLctlM=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=j0dLUgy6RatXwDFaygx8KACflNu6XbQSqNic+6yS6QsNKJOzRAkwCxed+8WZQRRHd
         06LGQsnpAo2bI1++31lN3jtYIRkpWDXtTnjc4DYLxX3zIOIDqewOB9U12uuP9IQNma
         Wk2nVCCX4UAtQAQiBvz3JBaLrQa35wYOdCpbFuRg+vzjnH/eTg3OuUhBWPcPIbFHt3
         +UL1o1NceiT6PSCkKf0WOXY8qznNpTHmSEoqrBfZqr9OjNynlsEFTKGGr81hHw9rLL
         1cZPUpm8RTlvB32HUAiCsNfx+bNimi2LE+to3Lktc/bgvk7KzYqya5DAcuaZVUb1NI
         ZrDUGk7CVn+iA==
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-d9bc6447193so4152901276.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 19:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697594718; x=1698199518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctnR1hv0kXrpmBCToO6pQzJRW4HEzDKrT4MMMQLctlM=;
        b=AaAQgCCHmkJori8uC6nqCAPSZYFOl+8nRvqE7h9ItFLRJdgT6ULwCPSpTWfe/XVQph
         tbMJmMvztJlv4bQtQKv2Crkt/aBSXipeDaS/aN28ZqZmjBcSWt1fXrxeTr1n2pVqAmCY
         p1qIfiTzeuH/05UG9VEvP681VdOF+sKpsPSs0LChmhorgBATG/qEetFC2YmQQ3fATgNz
         PhRMsSeD9tWiMZxGTCt/VPkzHM3HJ9roH9p5UgGplmotrEISzGgfaD/LHOqB/LQ0g5Jw
         mVxHw/DXOTA5mQAbyCHTAjwvj0oKr1HA8Cwf7RwdK+avxg9tOIFmeLfcAOIAlajK7ki7
         lfAA==
X-Gm-Message-State: AOJu0Yy/7P27Td6NFni/bsIfu3f3pk765w+pgvDXMfDL1kyflKrqEeds
        xedVcPYjtsf32E6j46ndpxXpqD+7SUy7yW1vhQ/zFl2uSe+V4V9gny7M4oIxim/SL/9sJI3inrX
        jYtWV5xUiNAi2sVb0ZgFDoZr1/VuhBC/WHqzFOcGfYodkqeRHbu55IrG8Pd4DUoZFEFw+61KAhD
        70RQ==
X-Received: by 2002:a25:bc86:0:b0:d9a:f949:45d1 with SMTP id e6-20020a25bc86000000b00d9af94945d1mr3788297ybk.13.1697594717929;
        Tue, 17 Oct 2023 19:05:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3NO+gNCjHOLnZ+1nzdO2WTn856xGQyUWcYjalo+HBKtyLxktJYiIASqHvgB+sUPhWf23/HTpzMJucNWWQcQ=
X-Received: by 2002:a25:bc86:0:b0:d9a:f949:45d1 with SMTP id
 e6-20020a25bc86000000b00d9af94945d1mr3788289ybk.13.1697594717626; Tue, 17 Oct
 2023 19:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
In-Reply-To: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Wed, 18 Oct 2023 10:05:06 +0800
Message-ID: <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
Subject: Re: [Bug Report] intel/vbtn: Dell Inspiron 7352 has unreliable
 tablet-mode switch
To:     Arnold Gozum <arngozum@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Arnold Gozum <arngozum@gmail.com> =E6=96=BC 2023=E5=B9=B410=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=888:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> In Linux 5.11, Dell Inspiron 7352 was added to the
> dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
> 10 (actually it was me who submitted the patch).
>
> However, the tablet mode switch can be unreliable. Randomly, switch
> events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
> which I have tested by running evtest while flipping the device to and
> from tablet mode. This is fixed after a reboot, or a suspend followed by
> unloading and reloading the intel-vbtn module. It can also sometimes be
> the case that upon resume, SW_TABLET_MODE does not reflect the actual
> state of the device, which is fixed by physically flipping the screen
> back and forth to update the state.
>
> Because of these issues, I think this model should be removed from the
> allow list, unless more investigation should be done.
Hi Arnold,

It's been a long time since you submitted the patch. Did those issues
not occur during that time?
Have you tried updating the BIOS to see if it helps?

From your description, I think calling VBDL might reset the status.
You might want to try it below.

diff --git a/drivers/platform/x86/intel/vbtn.c
b/drivers/platform/x86/intel/vbtn.c
index 6fa1735ad7a49..681650f52ff22 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -198,6 +198,8 @@ static void notify_handler(acpi_handle handle, u32
event, void *context)
       autorelease =3D val && (!ke_rel || ke_rel->type =3D=3D KE_IGNORE);

       sparse_keymap_report_event(input_dev, event, val, autorelease);
+
+       acpi_evaluate_object(handle, "VBDL", NULL, NULL);
}

/*

>
> Thanks,
> Arnold
