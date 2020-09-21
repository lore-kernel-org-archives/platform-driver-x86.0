Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D154AC43464
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 12:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DAC921789
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 12:09:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7aob37Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgIUMJQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUMJQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 08:09:16 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80F8C061755;
        Mon, 21 Sep 2020 05:09:15 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l71so8857846pge.4;
        Mon, 21 Sep 2020 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/xieKg8Y2xMyQEnMsmrFnXy6LszAmP4QRelP80Odzns=;
        b=B7aob37QmIHyKeeZZthEoBuWNFedZ8o5FKslhgqiI4N+2+m95rrIpGrtIXxpgQp3bc
         AQGObxkkUiVvxvWwbvHtiv7C8pMQk34sqRI6BcfJ3CNb7wnW8390NGZpHVEtw4DER9pg
         GVoqHdlvJKlS0wFtLejAHx93HFnKB+/vozpAKmkuQ5H00JcIMyRLvguceuVyKYHs5515
         I1WMi7RbWuupRxRr5AQ4c6XJhGHF88p6lbqFQ+LVjmJ3ZaTnn3Wm4TwGc+XMtx9/+vkJ
         AabCaVuCMCvStlldZnSvX++qEXpYeK3by4lvE81/4sDrqW2P8s/6a/Jd2xkfNn20ZCT+
         MWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xieKg8Y2xMyQEnMsmrFnXy6LszAmP4QRelP80Odzns=;
        b=rmt85foy3ziQMYRH0AVO0sh6Anzc7MkUo9SX9WEQuug9gssKL0V3VfyciLVgap+nWT
         BCbM2GKRwuO+yjZSzxnZfX9ez6u2HLA6FpZi6hlf7tlw8ZE+R5KYEPMyPe7f1ko+k0hg
         olyKqHvNRm8iyN2Z/ngEI0ode3UlvCO1RJHUX5irXG6UXAe/lCcmtMFKV0EJhRdnHFhg
         LmyQSZB3xdbcRcfyvtlgaQMo8JfdDVDlqLR6PupgmgWg4ApHeC+fw8kUpxNKdJgaT1Ym
         ZAhGnrmfJ8NfEzysbfElP19OlOgoqEtAaCGdpadZ2gn5YroPMKF82vmafLApBgJsoaQb
         qniA==
X-Gm-Message-State: AOAM533LxMmHFriVI7GeWNlZCySFy4mZ9iz5RBrtjnbGFsNXh80VzO09
        lYz7ZaiDeXy+2dPwwK6om1+KumBqbGG02qC8s24=
X-Google-Smtp-Source: ABdhPJzYdyrgIdgsYWKYhRzI4aQK5A53bTCaYG9qjZcgPXj9v4WP7VIG/ZjCAlIB1L2bLosFe6D7VIWKd0rzd0fhq/U=
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr42009700pfc.7.1600690155446; Mon, 21
 Sep 2020 05:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200917065550.127400-1-divya_bharathi@dell.com>
 <001ba7fe-fb88-cbe3-c413-1c6973b9e786@redhat.com> <CAHp75VcgVgSH6CLr78wfoK8fQVGk2g1x7CK+pAqmMcUDXHoa8w@mail.gmail.com>
In-Reply-To: <CAHp75VcgVgSH6CLr78wfoK8fQVGk2g1x7CK+pAqmMcUDXHoa8w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Sep 2020 15:08:57 +0300
Message-ID: <CAHp75VdOYk0xRKPzTygAMiEiSAmJZBrawZKSjPHiwzd8AbXfiQ@mail.gmail.com>
Subject: Re: [PATCH v3] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Divya Bharathi <divya27392@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya_bharathi@dell.com>,
        mark gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 21, 2020 at 3:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Sep 21, 2020 at 2:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 9/17/20 8:55 AM, Divya Bharathi wrote:
>
> ...
>
> > Now I see that you try to correctly deal with strncpy-s nastiness
> > everywhere, but please just don't use it all.
> > Not using strncpy at all is much better.
> >
> > A lot of the strncpy usage is hidden in:
> >
> > strncpy_attr(char *dest, char *src)
> > {
> >          size_t len = strlen(src) + 1;
> >
> >          if (len > 1 && len < MAX_BUFF)
> >                  strncpy(dest, src, len);
> > }
> >
> > Why is there no warning printed when the source string
> > is too long ? Now we just quietly throw away the
> > data, which seems undesirable.
> >
> > Also wouldn't truncating the data to fit in MAX_BUFF be better?
> > (honest question, I do not know which option is better)
>
> And don't forget new compiler warning if it can prove that string will
> be NUL-terminated.

can -> can't


-- 
With Best Regards,
Andy Shevchenko
