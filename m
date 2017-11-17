From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 3/5] platform/x86: intel_telemetry: Fix local variables
Date: Fri, 17 Nov 2017 15:29:15 +0200
Message-ID: <CAHp75Vc60WZiT=Fqva0ToM+9qY8O0xcgXeb1x34WMFK2hPHoyw@mail.gmail.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com> <1510827497-25188-4-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:43171 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756600AbdKQN3Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 08:29:16 -0500
In-Reply-To: <1510827497-25188-4-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Thu, Nov 16, 2017 at 12:18 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> Remove unnecesary 'static' qualifier.

unnecessary

Looks like a candidate to be folded in previous one.

-- 
With Best Regards,
Andy Shevchenko
