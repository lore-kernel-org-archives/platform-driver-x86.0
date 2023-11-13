Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755A6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Nov 2023 18:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjKMS53 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Nov 2023 13:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKMS52 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2023 13:57:28 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29C2F5
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 10:57:25 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so3935425276.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699901845; x=1700506645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xdDpFooxbLf0WugGnQCSaY+DcFtFJ8L+AU7CEWqMsT8=;
        b=cgNBhIg6gWpIoYGRUgi225iEUEC7UWuzak0ANgkKY/+Bmqu1TTfDZDPQP9hdE5nRZ+
         qAoe4LSJuNXdFhMGSua6G7r3GakRTRQHmgaS3uxNG+/cxnA4w8Lp2bEzT53RgBNx4xSa
         difzsUCEqMEpP8VkYUPVVtg69CHsS3gZTFJdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699901845; x=1700506645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdDpFooxbLf0WugGnQCSaY+DcFtFJ8L+AU7CEWqMsT8=;
        b=scRu3IZz62o4XdlMmhdveP/m8GUdNB17lw1GkjJDQVvxqNeMmkz27qgx1kGFOhJC7h
         tX06pClOHScPIRVSyTm8TlCUqliZc2iRvcABTt/0XJV/1u2ZpoBOdmxSSnuqm43LQN0E
         ryQ1bFKRD9P+Fzd/LFZRci+uhK/h6csGvzdfADGcu3kLpeVxJScNduuhr0BRH+qZ+HVM
         Nq3C6gNbxdW6BC2uzrDERtxgut+4AiGr/qiopQ29Dprh22nd/yj2jniPqcfe2But7G5x
         Bg0H1z4HvF3K+mkC6wL3mtjvGfwL6Kc+DmYqht24dNLBs5yKIfbxYyZYEmGHmIEH+pgq
         0YpQ==
X-Gm-Message-State: AOJu0YwDThtnH0wnQi31UpSm8qbH6VlHpV7ARoCp70P5cqpK0J5NlDtg
        XFEVO9ezwnO1+FCIx6UztUzeAyewZthzYBwJVd1lVQ==
X-Google-Smtp-Source: AGHT+IGtmWf25HXYETPjTxjZbMVeoISfeGCX5JVwia5Pmmlb2noCBVKk8jMeQSTfsnibC0UyfojJseRMT6tCKXjT4Sc=
X-Received: by 2002:a25:f827:0:b0:daf:6330:cc1d with SMTP id
 u39-20020a25f827000000b00daf6330cc1dmr366383ybd.24.1699901844808; Mon, 13 Nov
 2023 10:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com> <a7435bf5-4465-5835-9595-ab453c8f125c@linux.intel.com>
In-Reply-To: <a7435bf5-4465-5835-9595-ab453c8f125c@linux.intel.com>
From:   Mark Hasemeyer <markhas@chromium.org>
Date:   Mon, 13 Nov 2023 11:57:13 -0700
Message-ID: <CANg-bXBWSF7k9PqMpz+pQWoGc1T6xWo2Nds5Z5vH-f6_Vq8j7g@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: adjust amd_pmc_get_dram_size() behavior
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Mark, does this patch solve the issue for you?

The patch as-is does not compile as you suggested. But beyond the
unitialized `ret`, the patch does solve the issue for me.
