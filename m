From: Prarit Bhargava <prarit@redhat.com>
Subject: Re: [PATCH v3 0/6] Add CascadeLake-N Support
Date: Mon, 14 Oct 2019 09:15:50 -0400
Message-ID: <67aaedb2-dc74-7a60-7345-1c160e6b08e5@redhat.com>
References: <20191007193100.36934-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007193100.36934-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 10/7/19 3:30 PM, Srinivas Pandruvada wrote:
> Add support for SST-BF on CascadeLake-N support.  The CascadeLake-N
> processor only support SST-BF and not other SST functionality.
>

Sorry Srinivas, was away from keyboard all last week :(

> v3:
> Fix crash due to geline

^^^ curious how you hit this?  I was repeatedly testing and couldn't
get it to happen.

> Fix display to perf-profile info and base-freq info command
> Fix output for coremask
> Fix base frequency CPU list. This should be displayed for a package
> Auto mode support for base-freq enable/disable
> One of the patch for config only change folded to next one where it is
> used.
>
> The patch 1 has nothing to do with the CLX-N. It saves some bytes in the
> size.
>

Reviewed-by: Prarit Bhargava <prarit@redhat.com>

P.
