Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996A2C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:05:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ADF5207B6
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbhAPUFF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbhAPUFE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:05:04 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C76C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:04:24 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id m6so7721960pfm.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WRNP7CeKd7hB0Qxl9f7M83zqXJum7G0OPQkPM6N7YX8=;
        b=XhwdMC2GTAdW7LSMICQDtYlUkV3Wuj8JtJ4Y5ZlaDNTUxuXpXoASteUNGTWmdjoVnM
         ejb72cqIATVC/NKwIATI24SR43x68NZHzKmq0ciBxTBKxp6aOhXWZoXHg6ZqTMHOw4EZ
         NRuam6D3iI+ovI6myoq60Y50ZRHMhJ/yo0uuVnTLMkxPGWEtpgbcGDFPeKyjuKAUvyVd
         HW9CNg8MyDtccXB6TDVyvOkeTTzayy7/QHx8VE1ghhupBCgi1fF4+5AX9DBG7baMuD5L
         1CIOVVMYPDc5fTyFz9Iz9k7JLEiroxYMy/xvU6imdTGcqohKBg9OJ1zCjGGmkmGHQleY
         /G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WRNP7CeKd7hB0Qxl9f7M83zqXJum7G0OPQkPM6N7YX8=;
        b=I5qYki7nkZV2EBn78D+JDnF64BCWdXNCPVMeMvH4cEimoVHZ/6IlLdgPvXd683U3va
         riN+0jyvnoADpjb3SeZ7iGirDD1u1oLIYiJCGDfGdqwZ1u1VbcM4xX+7JnJJMDf0Z1dL
         D697OU40R3Uqt+BHVKO+eUG9LkaQxU/OpImotMYuFN5IQIgkPJ0yfZFIlDaowxFEYwZb
         376avEU/j4Gn32W0QoBqe3S/8Botbf5By777eygOVJJ9ry2UswCZJ0CwZDYxdqEtbg2H
         c9pb3g20NMm0D/VQ0mHEp8psiIC1o86rT36J84vk8JSV0ZLHZf6hV8vTA7Irb/rTBNIK
         ruuw==
X-Gm-Message-State: AOAM530tGfjUFmSeVUq2SnAUcnwQBz2v8LWW+uiAZn23jyETrW3t4KyA
        Gc61ZjzErgLw/7bmPsJSX+L62hA7R3maQV/ODm4=
X-Google-Smtp-Source: ABdhPJxIomMLRcHnF5p1QfCdj5gNKnhvOQrwHKLDwanxntgxZq6iOSGB1bkFZvTb40qgSKhXHj1h6GlIA1lBsIJO71c=
X-Received: by 2002:a63:c04b:: with SMTP id z11mr19054770pgi.74.1610827463679;
 Sat, 16 Jan 2021 12:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-20-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-20-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:04:07 +0200
Message-ID: <CAHp75VeEj-OaO7O0zRFiubKTtxnJ2Fqt_uXCWskOshfcpmSCgQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/24] platform/x86: ideapad-laptop: fix checkpatch
 warnings, more consistent style
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Fix (almost all) checkpatch warnings. Reorder variable definitions from
> longest to shortest. Add more whitespaces for better readability. Rename
> variables named `ret` to `err` where appropriate.

As I said in many cases you actually introduced (okay, left it as is
while can fix at the same time) such a problem in the same series.

--=20
With Best Regards,
Andy Shevchenko
