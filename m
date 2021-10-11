Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3335CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A77E6103C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbhJKNiX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25641 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236965AbhJKNiW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 09:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633959381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uHe86D0+9HSkQCQI9gdmYfNs35nscG967x0fei7/3Sc=;
        b=eNIkVUox3E0MyPTV2g6Olj7xkJK4LQShPTllLUT/PHMqlC7/MtL14JwKzKZd/WcQ44ut1R
        PM24cuIk6YcttA8mzX8gbvvt+zV6iB8f7DJOcxn5zzwZOnx/CrSqt7gsnQS40NAa2BAuDL
        JRgT3tEieudP0ZHnE9p7qNYfsQ2NY7I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-9zFV2yS3NvuHnZUTgjqDGw-1; Mon, 11 Oct 2021 09:36:20 -0400
X-MC-Unique: 9zFV2yS3NvuHnZUTgjqDGw-1
Received: by mail-ed1-f70.google.com with SMTP id e14-20020a056402088e00b003db6ebb9526so6321393edy.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 06:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uHe86D0+9HSkQCQI9gdmYfNs35nscG967x0fei7/3Sc=;
        b=5d1c4IHqKKjyfekN6bfcNd9u6bNsxFeuDXgv4/EuHQwyydgbe5BRjkfRkLeuVrauBf
         8cjikGPSAMH3SNtMcw5dYqx1txieY/YoZ/YSLR6+aIGRUcuQxsxy11CD/feuUpg6Zkj0
         4+XdNjZLQvJjGd5M5+fo2UjXdQ7qBZR9GIEqWJvJh4a8I1PIdfSFD0lRTUIooDxE27jL
         anDgbKAXEaykMcvdlNhd1rUk+jMCNaOXwSbyhOxVBv78j587HTdWz+eGIuQFWMpc/mjA
         fVWK+6on+HcUZ/aoY9QHkPeeS9boOuZPFBy/beXUAfrvGvXjG2e/m4A24/TM9LVE6BTG
         rgQw==
X-Gm-Message-State: AOAM533UNvxYn/009d4UWWDMeR7GlsX5vs6vAVJtOhuEDkGsv/3DRS5S
        +WO4a3bLnD71+UPNa9yApzQt6wrHNC03yGVprqJe8JI0Q9yU3cIhOawW4i0P4QcGUbpXicpfGJc
        gsVBttIIqCVF8AS/pp6PzvTL5LMuq+GvGWj/EIaQVYnywwaobnjF/Qb2d2Bl1Zx2ueAd98vxSgm
        nrCwnzhzTekQ==
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr16099572ede.238.1633959379507;
        Mon, 11 Oct 2021 06:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrJGPPxVQTyMxL0GifZrDFtfAmBX/n9m1xonFauKYVQffG6tYBEjVi/imTxjJfsMZ+H1bUFg==
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr16099531ede.238.1633959379286;
        Mon, 11 Oct 2021 06:36:19 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id x14sm4744935edd.25.2021.10.11.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 06:36:18 -0700 (PDT)
Subject: Re: [PATCH 0/3] platform/x86: intel_scu_ipc: timeout fixes and
 cleanup
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210928101932.2543937-1-pmalani@chromium.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <95257882-ed9c-eb04-f09e-9d6e559ece2c@redhat.com>
Date:   Mon, 11 Oct 2021 15:36:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928101932.2543937-1-pmalani@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/28/21 12:19 PM, Prashant Malani wrote:
> This is a short series to make some fixes and timeout value
> modifications to the SCU IPC driver timeout handling.
> 
> Prashant Malani (3):
>   platform/x86: intel_scu_ipc: Fix busy loop expiry time
>   platform/x86: intel_scu_ipc: Increase virtual timeout to 10s
>   platform/x86: intel_scu_ipc: Update timeout value in comment

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Since these are clear bug fixes I will also include these
in my upcoming pdx86-fixes pull-req for 5.15 .

Regards,

Hans


