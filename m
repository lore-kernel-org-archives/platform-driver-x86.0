From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 0857/1285] Replace numeric parameter like 0444 with macro
Date: Tue, 2 Aug 2016 14:34:07 -0300
Message-ID: <20160802173407.GA1939@khazad-dum.debian.net>
References: <20160802115249.7120-1-baolex.ni@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160802115249.7120-1-baolex.ni@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baole Ni <baolex.ni@intel.com>
Cc: dvhart@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com
List-Id: platform-driver-x86.vger.kernel.org

(cc list trimmed)

On Tue, 02 Aug 2016, Baole Ni wrote:
> I find that the developers often just specified the numeric value
> when calling a macro which is defined with a parameter for access permission.
> As we know, these numeric value for access permission have had the corresponding macro,
> and that using macro can improve the robustness and readability of the code,
> thus, I suggest replacing the numeric parameter with the macro.
> 
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Signed-off-by: Baole Ni <baolex.ni@intel.com>

NACK.

IMO, the proposed change reduces readiability for no good reason.  Most
people touching kernel code have 0444, 0644, 0755, etc. already
hardwired into their pattern recognition neural network, while the POSIX
S_* crap is actually bug food.

PS: no more ill-managed ultra-large patch bombs, *please*.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
