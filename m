From: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 03/13] eeepc-laptop: coding style: add curly braces
 around else compound
Date: Mon, 15 Sep 2014 21:58:37 +0200
Message-ID: <20140915195836.GA7867@gmail.com>
References: <1410563212-31565-1-git-send-email-fransklaver@gmail.com>
 <1410563212-31565-4-git-send-email-fransklaver@gmail.com>
 <20140915194141.GA62440@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140915194141.GA62440@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 15, 2014 at 12:41:41PM -0700, Darren Hart wrote:
> On Sat, Sep 13, 2014 at 01:06:42AM +0200, Frans Klaver wrote:
> > Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> 
> Hi Frans,
> 
> Please merge the 3 coding style fixes into one patch. There is no functional
> change here, and each of the 3 is obvious. Please include a simple commit
> message to the effect of:
> 
> "
> eeepc-laptop: Coding style cleanup
> 
> Correct white space and brace usage per Documentation/CodingStyle.
> "
> 
> As a point of policy, I will not merge commits without a message, no matter how
> trivial.

That's fair enough. I'll do some sanity testing today or tomorrow and
roll v2, unless some other remarks come up in the mean time.

Thanks,
Frans
