From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch v3 1/1] platform/x86: move module mlx-platform from
 arch/x86 to drivers/platform/x86
Date: Mon, 31 Oct 2016 09:31:12 -0600 (MDT)
Message-ID: <alpine.DEB.2.20.1610310930430.5481@nanos>
References: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 31 Oct 2016, Vadim Pasternak wrote:

> Since mlx-platform is not an architectural driver, it is moved out
> of arch/x86/platform to drivers/platform/x86.
> Relevant Makefile and Kconfig are updated.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Acked-by: Thomas Gleixner <tglx@linutronix.de>
