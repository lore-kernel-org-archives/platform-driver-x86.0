From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 4 Apr 2011 13:22:25 +0100
Message-ID: <20110404122225.GA15883@srcf.ucam.org>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Joe Perches <joe@perches.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 04, 2011 at 11:21:43AM +0200, Sedat Dilek wrote:
> My build breaked today.
> Looks like the issue was introduced by commit
> 2af915b1eda9a671973256540035f8a6da1d57b4:
> "thinkpad_acpi: Convert printks to pr_<level>"

Yes, this seems to break the non-debug case. Joe, can you take a look? 
I'll drop this for the moment.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
