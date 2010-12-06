From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] wmi: use memcmp instead of strncmp to compare GUIDs
Date: Mon, 6 Dec 2010 22:17:50 +0000
Message-ID: <20101206221750.GA1885@srcf.ucam.org>
References: <1290980810-5903-1-git-send-email-cascardo@holoscopio.com> <20101206220231.GB1139@srcf.ucam.org> <20101206221345.GG4187@barata.holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101206221345.GG4187@barata.holoscopio.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlos@strangeworlds.co.uk, stable@kernel.org, ceolin@ulevel.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 06, 2010 at 08:13:46PM -0200, Thadeu Lima de Souza Cascardo wrote:
> On Mon, Dec 06, 2010 at 10:02:31PM +0000, Matthew Garrett wrote:
> > Applied to -next, thanks.
> > 
> > -- 
> > Matthew Garrett | mjg59@srcf.ucam.org
> 
> Hello, Matthew.
> 
> I consider this one a serious bug and with a trivial fix that should go
> to Linus, for the next release candidate. I also consider it should go
> to stable releases, and that's why I'm copying stable.

Sure, I'll pull it back for .37 as well.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
