From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Delete unused function
 ipc_data_readb()
Date: Wed, 24 May 2017 14:39:32 +0100
Message-ID: <20170524143932.11593845@alans-desktop>
References: <20170523205539.71450-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170523205539.71450-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 23 May 2017 13:55:39 -0700
Matthias Kaehlcke <mka@chromium.org> wrote:

> The function was added by commit 0a8b83530b6f ("intel_pmc_ipc: Add Intel
> Apollo Lake PMC IPC driver") in 2015 and hasn't been used since then.
> Removing it fixes the following warning when building with clang:
> 
>     drivers/platform/x86/intel_pmc_ipc.c:189:18: error: unused function
>         'ipc_data_readb' [-Werror,-Wunused-function]

It is however also part of the API and a consistent sensible function to
have present should it be needed. As it's static it's eliminated
correctly by gcc.

I'm all for eliminating unused functions but in this case I have to wonder

Alan
