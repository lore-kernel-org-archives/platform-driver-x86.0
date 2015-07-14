From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_scu_ipc: move local memory initialization out of a
 mutex
Date: Tue, 14 Jul 2015 12:47:06 -0700
Message-ID: <20150714194706.GA35521@vmdeb7>
References: <1436798694-6907-1-git-send-email-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436798694-6907-1-git-send-email-christophe.jaillet@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 13, 2015 at 04:44:54PM +0200, Christophe JAILLET wrote:
> '{ }' and memset will both reset the cbuf buffer.
> Only once is enough and this can be done outside fo the mutex.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Queued, thanks Christophe.

-- 
Darren Hart
Intel Open Source Technology Center
