Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA49C001DF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Aug 2023 15:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbjHAPg2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Aug 2023 11:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbjHAPg1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2023 11:36:27 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412E9EE
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Aug 2023 08:36:26 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so3480246e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2023 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690904184; x=1691508984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6lq4IloqxAvElVRa7KBEVjB+c+jtqwocfl4Lk7T7PU=;
        b=V2LxRtUVy9sgQjLgEYGtjGFdWmc+wo0hRTzUnM5sRsMC+U1OShRRYzd0J4ur3VgXfO
         BcCQTe9UCIft7/+rsGIrNHReVQYnoV7BZIcQVwOyz/aJo/x5VgfO7eQqbkqTZZZRQuno
         yKViiwqYpICJDFOQcmj7Tg5YKd/GSXBtGio+bykBd3pJ7S238RxOcdA23oJpT4falXU+
         /epTuStd+BbfNAlV+EwnH9vQk3tO3woO6X9NJZoygG0QwmnziAaeMcimFcxeBZ8+EYmT
         W4uBfjqPCNS2RIoi/VWm3Onpa929EdhsdrW8jOdSGAFhKuTLl8YqfQwsJH9IfQCWoBMS
         hRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690904184; x=1691508984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6lq4IloqxAvElVRa7KBEVjB+c+jtqwocfl4Lk7T7PU=;
        b=eQDbNb5k9VrkG4ZTtJ8wv9Z22klOHl8UqNvtC8RaImU7NEpzJzPHn1kRC3GlHxLNNU
         5bST0vGeG14NG1jXVVtMzFwhnNfERm13B/RpJCGzOYkupIKZjLZfKE4PrT/bLKjJ+Ta5
         r0TNDY0+VLgmveFa0D2K1+Z9ZsW0NwCekQ6e2RwGaaKVD43+CNB0KdSC5YGpspLB5C4f
         16Q7IwYAIQPmwOtdGWBTSIYwmzijdzcCllKxIRyCDtpWw0oE4Rzj0xhA2iep3eBQy0ET
         CpymqrUEnTAd7WBPPHOLYnXzNjUADuqa9RrO1Gb+5QjNkzVJVyFXPzOK3uQQ5vBJTOO4
         hntg==
X-Gm-Message-State: ABy/qLZsrk8So38xKQGoQVFzw6E5ZYpg4DDLL1KMmz8H3VJ8bs3rmCn/
        3JpwWbi7Wu0ScPOnsutNnZlp9A==
X-Google-Smtp-Source: APBJJlG9hqpKVE3CffgY4JKqxsm4hQJEwyVoYovNa5KdFoL5KglQQjFmxfPi/kCWzY/RSgjVws63LQ==
X-Received: by 2002:a19:4f54:0:b0:4fb:89f2:278e with SMTP id a20-20020a194f54000000b004fb89f2278emr2880042lfk.68.1690904184105;
        Tue, 01 Aug 2023 08:36:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003fa95f328afsm11557522wmi.29.2023.08.01.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 08:36:23 -0700 (PDT)
Date:   Tue, 1 Aug 2023 18:36:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de,
        ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH 0/8] hp-bioscfg: Overall fixes and code cleanup
Message-ID: <18e82ad0-8011-480a-a9f5-8bafb15b1ce9@kadam.mountain>
References: <20230731203141.30044-1-jorge.lopez2@hp.com>
 <c891e1cb-3fb6-448a-850c-e94c48d32c66@kadam.mountain>
 <CAOOmCE8xLxE9fSZNhPeYumRyzg9S-C9++8LH5jDq5vVwgFMdCQ@mail.gmail.com>
 <6c6143bd-5352-4edc-a44c-143c27fbf1cf@kadam.mountain>
 <CAOOmCE85enO=C+i8SUAroJpMCi7cGYvJ5TOCgsVbL2b-6pPpNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOOmCE85enO=C+i8SUAroJpMCi7cGYvJ5TOCgsVbL2b-6pPpNw@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2023 at 10:10:05AM -0500, Jorge Lopez wrote:
> Ok. Thanks for the clarification.  I will remove 'value_len' and
> replace all its references with 'size'.

Ugh...  No, that's worse than the original.  Just leave value_len as is
in that case.  :P

regards,
dan carpenter

