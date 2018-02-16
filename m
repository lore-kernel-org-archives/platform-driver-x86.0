From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v1] platform/x86: wmi: Replace kmalloc + sprintf() with
 kasprintf()
Date: Fri, 16 Feb 2018 15:55:24 +0000
Message-ID: <829ccf8330b7418a976205665e0ab4bd@AcuMS.aculab.com>
References: <20180216154024.389-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216154024.389-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Andy Shevchenko
> Sent: 16 February 2018 15:40
>
> kasprintf() does the job of two: kmalloc() and sprintf().
> Replace two calls with one.
...
> -		buf = kmalloc(strlen(wdriver->driver.name) + 5, GFP_KERNEL);
> +		buf = kasprintf(GFP_KERNEL, "wmi/%s", wdriver->driver.name);
...

Except that kasprintf() has no idea how long a buffer is needed.
It might even do the printf twice just to get the length.

	David
