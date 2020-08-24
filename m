From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: laptops: thinkpad-acpi: fix underline
 length build warning
Date: Mon, 24 Aug 2020 16:10:33 -0600
Message-ID: <20200824161033.0448f327@lwn.net>
References: <7b2ecef9-dfb7-808a-7c05-4e4f44b363c4@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7b2ecef9-dfb7-808a-7c05-4e4f44b363c4@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Nitin Joshi <njoshi1@lenovo.com>, Sugumaran <slacshiminar@lenovo.com>, Bastien Nocera <bnocera@redhat.com>, Mark Pearson <markpearson@lenovo.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 23 Aug 2020 15:55:16 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix underline length build warning in thinkpad-acpi.rst documentation:
> 
> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1437: WARNING: Title underline too short.
> DYTC Lapmode sensor
> ------------------
> 
> Fixes: acf7f4a59114 ("platform/x86: thinkpad_acpi: lap or desk mode interface")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Nitin Joshi <njoshi1@lenovo.com>
> Cc: Sugumaran <slacshiminar@lenovo.com>
> Cc: Bastien Nocera <bnocera@redhat.com>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> Cc: ibm-acpi-devel@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  Documentation/admin-guide/laptops/thinkpad-acpi.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
