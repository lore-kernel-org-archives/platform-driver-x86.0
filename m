Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0827FEE14D0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 20:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbjIFUPD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 16:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjIFUPB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 16:15:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B95719A5
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 13:14:57 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-501bd7711e8so304205e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694031295; x=1694636095; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WPzah6a0gawYTHXatiWeFjlWd86MLCYavR2ag2EMlk=;
        b=kVEAd5MkC1VJqC2+ymn8KulA8y3Gv34CyyH/DjEUcqSxezbH7rc8fL/nfFnl3nWERQ
         TzAOFPac50kbFrGApgaqkxq6KKYIXUsHHt3ERNlkaNurTS28PgjfNbnBkcDZLdLSgTQ8
         zQjAXDhs3rONFPKF03gB4yAEhlggYynjj5UgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694031295; x=1694636095;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WPzah6a0gawYTHXatiWeFjlWd86MLCYavR2ag2EMlk=;
        b=aVGZytWe1yMdQGg2iqTigKX2NCSBTG1sNgTD+ttHj/ddet/tHWxrgfBKeqWjeVtfJw
         bTEJSvDSrNOBV81WFwLhlw3YfooIE8lfyHd6Ie2rYZj+PI/aBiYp3Ikc1OZH0qk3dgFO
         Yn/Pk/ZpnYIZaPWMQi6VxH1q2l/YYxVfTWdURO9IhIdYJn5Rp0ZLxGy2rBRKUuXbM5z4
         NoNMapgYmF/sYDrVur4B0iuP589Vj1l/Xihyy0zUhRChv9l00NvEZ/m83HgXUndw3m0s
         kE26pZoaKYwZzmTClGK1EelTC1KX9mu6HYkfvwwtRA4x0HTTuh87lgvvAPtFTOHapwA1
         rfdA==
X-Gm-Message-State: AOJu0YxMcIjoLKTOKJIJjSmy8JCFI9Q7Ag9Wp8k68a747RxLrrCksSIM
        oVd6g3P+7oraHuUap9Vcqete+Gl3Z/Gvcz6wHVoHnQ==
X-Google-Smtp-Source: AGHT+IHGpN/V+yPJHO3CFg5dhUD5tJnDqFY2Ihzc4V7ehcz+vvLZt/aeSmJ7tWFPH7XJJfq/zPjlLQcBvgUGt2PviR4=
X-Received: by 2002:a05:6512:547:b0:500:c292:e44e with SMTP id
 h7-20020a056512054700b00500c292e44emr2999496lfl.54.1694031295358; Wed, 06 Sep
 2023 13:14:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 15:14:54 -0500
MIME-Version: 1.0
In-Reply-To: <ZPjbZqIQBlIGpoCK@smile.fi.intel.com>
References: <20230906180944.2197111-1-swboyd@chromium.org> <20230906180944.2197111-2-swboyd@chromium.org>
 <ZPjbZqIQBlIGpoCK@smile.fi.intel.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 15:14:54 -0500
Message-ID: <CAE-0n52REGuVrqG8LUdWzjgqAun7uvDFPJeSkjX02OxD=fUhqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: intel_scu_ipc: Check status after
 timeout in busy_loop()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Quoting Andy Shevchenko (2023-09-06 13:04:54)
> On Wed, Sep 06, 2023 at 11:09:41AM -0700, Stephen Boyd wrote:
> > It's possible for the polling loop in busy_loop() to get scheduled away
> > for a long time.
> >
> >   status = ipc_read_status(scu); // status = IPC_STATUS_BUSY
> >   <long time scheduled away>
> >   if (!(status & IPC_STATUS_BUSY))
> >
> > If this happens, then the status bit could change while the task is
> > scheduled away and this function would never read the status again after
> > timing out. Instead, the function will return -ETIMEDOUT when it's
> > possible that scheduling didn't work out and the status bit was cleared.
> > Bit polling code should always check the bit being polled one more time
> > after the timeout in case this happens.
> >
> > Fix this by reading the status once more after the while loop breaks.
>
> ...
>
> >  static inline int busy_loop(struct intel_scu_ipc_dev *scu)
> >  {
> >       unsigned long end = jiffies + IPC_TIMEOUT;
> > +     u32 status;
> >
> >       do {
> > -             u32 status;
> > -
> >               status = ipc_read_status(scu);
> >               if (!(status & IPC_STATUS_BUSY))
>
> > -                     return (status & IPC_STATUS_ERR) ? -EIO : 0;
> > +                     goto not_busy;
>
> Wouldn't simple 'break' suffice here?

Yes, at the cost of reading the status again when it isn't busy, or
checking the busy bit after the loop breaks out and reading it once
again when it is busy. I suppose the compiler would figure that out and
optimize so that break would simply goto the return statement.

The code could look like this without a goto.

	do {
		status = ipc_read_status(scu);
		if (!(status & IPC_STATUS_BUSY))
			break;
	} while (time_before(jiffies, end));

	if (status & IPC_STATUS_BUSY)
		status = ipc_read_status(scu);

	if (status & IPC_STATUS_BUSY)
		return -ETIMEDOUT;
	
	return (status & IPC_STATUS_ERR) ? -EIO : 0;
