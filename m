From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/x86: Remove PMIC GPIO block support
Date: Thu, 05 Jan 2017 15:44:06 +0200
Message-ID: <1483623846.9552.238.camel@linux.intel.com>
References: <20170105113228.132165-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170105113228.132165-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2017-01-05 at 13:32 +0200, Andy Shevchenko wrote:
> The Moorestown support was removed by commit 1a8359e411eb ("x86/mid:
> Remove
> Intel Moorestown").
> 
> Remove this leftover.

Okay, this one dependent to removal of its users.
So, will wait until that part makes upstream.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
