From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v3 0/6] Add CascadeLake-N Support
Date: Mon, 14 Oct 2019 09:47:56 -0700
Message-ID: <0c18136df4c261afaa55debc72f9a2d3249771e1.camel@linux.intel.com>
References: <20191007193100.36934-1-srinivas.pandruvada@linux.intel.com>
         <67aaedb2-dc74-7a60-7345-1c160e6b08e5@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <67aaedb2-dc74-7a60-7345-1c160e6b08e5@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2019-10-14 at 09:15 -0400, Prarit Bhargava wrote:
> 
> On 10/7/19 3:30 PM, Srinivas Pandruvada wrote:
> > Add support for SST-BF on CascadeLake-N support.  The CascadeLake-N
> > processor only support SST-BF and not other SST functionality.
> > 
> 
> Sorry Srinivas, was away from keyboard all last week :(
> 
> > v3:
> > Fix crash due to geline
> 
> ^^^ curious how you hit this?  I was repeatedly testing and couldn't
> get it to happen.
I guess this depend on weather the local variable happen to be NULL.
This happens 100% on the system I am testing.

Thanks,
Srinivas

> 
> > Fix display to perf-profile info and base-freq info command
> > Fix output for coremask
> > Fix base frequency CPU list. This should be displayed for a package
> > Auto mode support for base-freq enable/disable
> > One of the patch for config only change folded to next one where it
> > is
> > used.
> > 
> > The patch 1 has nothing to do with the CLX-N. It saves some bytes
> > in the
> > size.
> > 
> 
> Reviewed-by: Prarit Bhargava <prarit@redhat.com>
> 
> P.
