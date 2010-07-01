From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH] acer-wmi: set permissions on interface file to S_IRUGO
Date: Thu, 1 Jul 2010 14:53:23 +0100
Message-ID: <20100701135323.GD31804@srcf.ucam.org>
References: <1277864423.14363.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1277864423.14363.1.camel@mola>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Len Brown <len.brown@intel.com>, Thomas Renninger <trenn@suse.de>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 30, 2010 at 10:20:23AM +0800, Axel Lin wrote:
> The interface file is not writable, thus set permissions to S_IRUGO.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Applied, thanks.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
