From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/1] intel_telemetry_debugfs: fix oops found while
 load/unload module test
Date: Thu, 1 Jun 2017 01:13:00 +0300
Message-ID: <CAHp75Vf+JfdeiPkpHrri5wgEuPbeuOcT3JjNkQM8qtCvZuy6ww@mail.gmail.com>
References: <709e8015ccece63cdf0c2e0cd491fd5ca2984e8d.1496351574.git.priyalee.kushwaha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:35406 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdEaWNB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 May 2017 18:13:01 -0400
In-Reply-To: <709e8015ccece63cdf0c2e0cd491fd5ca2984e8d.1496351574.git.priyalee.kushwaha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: priyalee.kushwaha@intel.com
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, souvik.k.chakravarty@intel.com, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Jun 2, 2017 at 12:33 AM,  <priyalee.kushwaha@intel.com> wrote:
> This fix oops found while testing load/unload test of
> intel_telemetry_debugfs module. Module_init uses register_pm_notifier
> for PM callbacks, but unregister_pm_notifier was missing from
> module_exit.

> +#ifdef CONFIG_PM_SLEEP
> +       unregister_pm_notifier(&pm_notifier);
> +#endif /* CONFIG_PM_SLEEP */

Neither here

> +#ifdef CONFIG_PM_SLEEP
> +       unregister_pm_notifier(&pm_notifier);
> +#endif /* CONFIG_PM_SLEEP */

Not there.

AFAIU we discussed to make unregister_pm_notifier() having stubs for !PM_SLEEP.

-- 
With Best Regards,
Andy Shevchenko
