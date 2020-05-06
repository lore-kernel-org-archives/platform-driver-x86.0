From: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Wed, 6 May 2020 17:39:31 +0100
Message-ID: <CAD2FfiE38TOKfVdSvPCq6z=QS1efANc2epZ+W3xTqe-GQA+Bqg@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com> <CAHp75VdD_3CxtwT_07R8Cc=SE6Uw+FDpom5YxTX4Adq4DPjKkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdD_3CxtwT_07R8Cc=SE6Uw+FDpom5YxTX4Adq4DPjKkQ@mail.gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 6 May 2020 at 17:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> Isn't it covered by Intel SPI NOR driver?

No, I don't think so. The Intel eSPI controllers don't operate at the
NOR level. This patch really just exports some PCI configuration (LPC)
registers to userspace.

Richard.
