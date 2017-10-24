From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Lenovo Yoga 920-13IKB
 to no_hw_rfkill dmi list
Date: Tue, 24 Oct 2017 17:22:28 +0200
Message-ID: <20171024152228.GA43845@localhost.localdomain>
References: <20171024143219.GA27308@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171024143219.GA27308@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Hug <philipp@hug.cx>
Cc: ike.pan@canonical.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 24, 2017 at 04:32:22PM +0200, Philipp Hug wrote:
> The Lenovo Yoga 920-13IKB does not have a hw rfkill switch, and trying
> to read the hw rfkill switch through the ideapad module causes it to
> always report as blocked.
> 
> This commit adds the Lenovo Yoga 920-13IKB to the no_hw_rfkill dmi list,
> fixing the WiFI breakage.
> 
> Signed-off-by: Philipp Hug <philipp@hug.cx>

Thanks Phillip, queued for review and testing.

-- 
Darren Hart
VMware Open Source Technology Center
