Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53751C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Nov 2022 23:00:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiKKXAq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Nov 2022 18:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230105AbiKKXAp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Nov 2022 18:00:45 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D594E11C0D
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Nov 2022 15:00:43 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k8so8195148wrh.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Nov 2022 15:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4hz464PTduUisDyOrNV9PbscjwoVWJWzPXGLA9kB9k=;
        b=SEjc93w0c8Nbbc3iHH9cN1spggyte0sMYyGlz/FaWQAKg0KRhaNBXqAjHM5mZQwc3n
         GuGW5UXPFq5D3X0W3V0iLZM+sOz54rRXERoBS/giJ+i9sdmeWD61yZ8zEOT32Tei8TGn
         mTvAO5i/oCu+pXAIw1zoySf2JCThfvYjx08zoZ0Kw73zOO6oNYDa5N5E+5iJ9fzDpg5M
         NhASYb7Pwv4K7J9PSIbZqQolTopUNrmI5WWHyCkOYEhaJwnq/5P/XkILnDcEoexjvesb
         dvLepFMZLmM0OZ5BzZJk0d8ayIKgNe5AGz2aeWaNxyk0+GL+EzckpqUZn5Zy20HLK5ec
         MRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4hz464PTduUisDyOrNV9PbscjwoVWJWzPXGLA9kB9k=;
        b=iocFK4ba9Y6+7RrZr9uWVD7EvpAn0e/GxKgrPtpN8KMTu6O7q2YVhVeAhcsdwC/0yN
         tM+FrbkqH328lMflkfLviNhTZ4JLl3l3s5WIEYzAJNRAmLFTuhw9N4p61C+8lzYelpVF
         Npl2M8zDaJ5I8+tCRIFOmquZgeotXUuYLg9M0sTjp+cdTF5feU8uWXsA/pbNoYorKvOA
         rHwR+MPFLsOEaSY2RWIQ003P0FgszkCVLvzAmZyJoLP0ClMLo0OdIQrpe6CEjDou853Z
         50oANOk+r8zcSBjP2a/MiUo9r+Qwvtu7ylCk+kpCpIkgmm5jYSNS95B/mFX+wR300Jo9
         fgdA==
X-Gm-Message-State: ANoB5pkt+vMcwjJySYro6xw0C67JJjBYvJJPyT/9Mu0Be/ay8t7i4pK3
        sQPNUmpeK0ddaADbJKruDgkcBxInTdkFTdHHG9Qg5YA1
X-Google-Smtp-Source: AA0mqf4UlPXk/z6hIGooUzAzJgvrgf06i4ATPUDHVm3Bieu8KlnIubmZO3bmILsz3x+YLfdGUDuqzZtRjcTe5hcWcnE=
X-Received: by 2002:adf:fa02:0:b0:23e:245b:edf1 with SMTP id
 m2-20020adffa02000000b0023e245bedf1mr2231804wrr.142.1668207642327; Fri, 11
 Nov 2022 15:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20221020201033.12790-1-jorge.lopez2@hp.com> <20221020201033.12790-3-jorge.lopez2@hp.com>
 <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com>
In-Reply-To: <dd8b494c-114c-e27e-4dcd-08dcb8b31d9d@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Fri, 11 Nov 2022 17:00:30 -0600
Message-ID: <CAOOmCE9YT3VxEbuMMX3MCvxEinHugvvYkGHgrnRN1fHVSy7cWw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

A quick note to check the next step.   The changes requested for
enum-attributes,c and several supporting functions will impact other
source files.  To save reviewing time,  I am planning to introduce the
same changes across all source files and then proceed to submit the
review.   Is this option acceptable?.

Regards,
