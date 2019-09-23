From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 0/2] intel-speed-select: Convert output to tables
Date: Mon, 23 Sep 2019 11:18:30 -0700
Message-ID: <44b6fd7a71d9e9f7dd82ac51473f45b48fa4679d.camel@linux.intel.com>
References: <20190923131638.6668-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923131638.6668-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2019-09-23 at 09:16 -0400, Prarit Bhargava wrote:
> The turbo ratio limits and turbo frequencies add a large amount of
> lines to the output.  The output can be truncated into human and
> machine readable tables to reduce the number of lines of output.
> 
Unfortunately this breaks json output. The idea is that the software
should be able to parse json output using available json libraries and
consume information, without developing complex parser.
For example:
#intel-speed-select -o out.json -f json perf-profile info
Copy paste contents of out.json in any online json editor/tools, itshouldn't give error. 

Thanks,
Srinivas


> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 
> Prarit Bhargava (2):
>   intel-speed-select: Display turbo-ratio-limits as a table
>   intel-speed-select: Display turbo frequencies in a table
> 
>  .../x86/intel-speed-select/isst-display.c     | 196 +++++++++-------
> --
>  1 file changed, 94 insertions(+), 102 deletions(-)
> 
