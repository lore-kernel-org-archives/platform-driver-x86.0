Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA654C0015E
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Aug 2023 15:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbjHAPER (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Aug 2023 11:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232445AbjHAPEQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2023 11:04:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCE31B1
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2023 08:04:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso53501205e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2023 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690902253; x=1691507053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5uuNfkxYesmIemPiABp4WONeX4fMNiIa9h0mEc9ZlfQ=;
        b=ddIC42148FiD1bFz0COMhlRajuwwmXRXtSttwUupyxZT7DuOlagS/guVxTNwy0NTF4
         bJHJSV96xm6m8m4X/U9hvhUOXVTemku23zEYJdxgXe+Fuol5Z5TrXpO8bMU3qNSA+7Iw
         0jbgd9V6ctfOHd/ucKm/R1SWBazIqu9uSP+/a8W1mo9khCsWFVJD6yRJvtBDE3fDQDpV
         CTNlm2eP2hV2tgTIBgJbmZ4CpIO9Awi16CttcrTadBe1/O/kblnek/Kr0FnCNdU+E/dI
         DzzCOchQvmNP3gzVWF6zsox+jGyUn6UVooc65dsZqnfI+iTioTam9oMwNmOuizW12Rt3
         oYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690902253; x=1691507053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uuNfkxYesmIemPiABp4WONeX4fMNiIa9h0mEc9ZlfQ=;
        b=W3Ke/jS0LXHcIi+m6vBumEpCGgLD4bQlkNgBG0AB9FRyAxv22/7SpQ1HTUPJyPvq5P
         VNzNkafCV56Fl0BbVQmFhy/XbAmmGEwOzmGZv432Hc2Ms9dS5tqxzAX48CZ/1xe9LShB
         t2d07yZXpZiKm//u2BPHcuKi0NkCOE5U6QH/fZiUGFWTmlzmruA2q2XDGhqQIy0QvBha
         fPZZGj3E++t1oBEs1mFKJjYyMewzeRuN5qaodfQboWkUCs4OcYOMm81qpm64S4CMas5f
         P7Pn7C4W6WofsYnaTSGKehOaSEl02A/gf5w522vf73PC8kduus5eWVzIj29wryAfQ28V
         D1Bw==
X-Gm-Message-State: ABy/qLYquv/PzyJqP7wRyuJe3HgG/XSIyxOQz1gxgeQOCF1fxFcZBBPa
        aS9Tn8ubaOcxqwVtikvbl9TPiw==
X-Google-Smtp-Source: APBJJlE+NvyG8l2+SLSauX+BQGM6V0ql3WRzZWkAP6hg+vtCeXJYp+g9ssAbkVLrMXs1/hRnD++T5w==
X-Received: by 2002:a1c:7915:0:b0:3fe:16c8:65fa with SMTP id l21-20020a1c7915000000b003fe16c865famr2596721wme.4.1690902253573;
        Tue, 01 Aug 2023 08:04:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d654d000000b00314398e4dd4sm16273770wrv.54.2023.08.01.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 08:04:13 -0700 (PDT)
Date:   Tue, 1 Aug 2023 18:04:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de,
        ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH 0/8] hp-bioscfg: Overall fixes and code cleanup
Message-ID: <6c6143bd-5352-4edc-a44c-143c27fbf1cf@kadam.mountain>
References: <20230731203141.30044-1-jorge.lopez2@hp.com>
 <c891e1cb-3fb6-448a-850c-e94c48d32c66@kadam.mountain>
 <CAOOmCE8xLxE9fSZNhPeYumRyzg9S-C9++8LH5jDq5vVwgFMdCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOOmCE8xLxE9fSZNhPeYumRyzg9S-C9++8LH5jDq5vVwgFMdCQ@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2023 at 09:52:05AM -0500, Jorge Lopez wrote:
> I will submit a new patch replacing 'value_len' for 'size' in line 267
> as indicated.
> 'value_len' is utilized earlier in the code so we cannot remove it
> completely from the function.
> 

After replacing size then it looks like this.

$ grep value_len drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
        int value_len = 0;
                                                               &str_value, &value_len);
                                                               &str_value, &value_len);

It's a write only variable.

regards,
dan carpenter

