From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] platform/x86: wmi: Switch to use new generic UUID API
Date: Sun, 13 Aug 2017 08:36:48 -0700
Message-ID: <CALCETrXMTFuEYZEZK8P90Z6oUwgxQzHeS3tQjKtyS5=VRpwT=w@mail.gmail.com>
References: <20170813141338.61667-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751365AbdHMPhK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 11:37:10 -0400
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com [209.85.217.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9ED75239B3
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 15:37:09 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id k43so29453424uaf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 08:37:09 -0700 (PDT)
In-Reply-To: <20170813141338.61667-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 13, 2017 at 7:13 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> There are new types and helpers that are supposed to be used in new code.
>
> As a preparation to get rid of legacy types and API functions do
> the conversion here.
>
> While here, update Copyright to reflect this change along with previous
> one for the topic.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>
> -               if (memcmp(block->gblock.guid, &guid_input, 16) == 0) {
> +               if (guid_equal((guid_t *)&block->gblock.guid, &guid_input)) {

As discussed in the other email, NAK.

This line should read:

if (uuid_le_equal(...))

or

if (uuid_le_equal_uuid(...))

or similar.  Barring that, I think memcmp() is far better than the
obviously-wrong-but-actually-secretly-correct guid_equal().

--Andy
