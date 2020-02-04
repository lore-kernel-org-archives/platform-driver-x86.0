From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/7] platform/x86: intel_pmc_core: Add debugfs entries
Date: Tue, 4 Feb 2020 13:34:14 +0200
Message-ID: <20200204113414.GB10400@smile.fi.intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
 <CAHp75Vfb38BEh2OZkO2EoQgCyBxaLoiwh8S_qKiPQRX1g+ZA2Q@mail.gmail.com>
 <BL0PR11MB31071AD85775C09B8EC26608F20B0@BL0PR11MB3107.namprd11.prod.outlook.com>
 <CAHp75VeRAWsqxfjOxw97SBPRLvcyF=SGrN84hT=UUNC6yQ6-_A@mail.gmail.com>
 <BL0PR11MB3107F8D50FCADD168EAA9E7BF2030@BL0PR11MB3107.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BL0PR11MB3107F8D50FCADD168EAA9E7BF2030@BL0PR11MB3107.namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 04, 2020 at 04:00:43AM +0000, Kammela, Gayatri wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Monday, January 27, 2020 11:00 AM
> > To: Kammela, Gayatri <gayatri.kammela@intel.com>
> > Cc: Platform Driver <platform-driver-x86@vger.kernel.org>; Linux Kernel
> > Mailing List <linux-kernel@vger.kernel.org>; Somayaji, Vishwanath
> > <vishwanath.somayaji@intel.com>; Darren Hart <dvhart@infradead.org>;
> > Westerberg, Mika <mika.westerberg@intel.com>; Peter Zijlstra (Intel)
> > <peterz@infradead.org>; Prestopine, Charles D
> > <charles.d.prestopine@intel.com>; Pandruvada, Srinivas
> > <srinivas.pandruvada@intel.com>; Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com>; Box, David E
> > <david.e.box@intel.com>
> > Subject: Re: [PATCH v1 0/7] platform/x86: intel_pmc_core: Add debugfs
> > entries
> > 
> > On Mon, Jan 27, 2020 at 8:03 PM Kammela, Gayatri
> > <gayatri.kammela@intel.com> wrote:
> > 
> > > > It doesn't apply to our for-next branch.
> > > Sorry to hear that. I've rebased the series on mainline 5.5-rc7. Should I
> > rebase it on for-next branch?
> > 
> > You should always base your branch on the for-next (whatever it's being
> > called) of the subsystem your series against of.
> 
> Hi Andy,
> 
> The current series has a dependency on Tiger Lake and Elkhart Lake patche which is merged in to mainline. 
> 
> (554f269f0f38 platform/x86: intel_pmc_core: Add Intel Elkhart Lake support
> 49a437941c3f platform/x86: intel_pmc_core: Add Intel Tiger Lake support
> 6268c0b278b5 platform/x86: intel_pmc_core: Make debugfs entry for pch_ip_power_gating_status conditional
> e39854781830 platform/x86: intel_pmc_core: Create platform dependent bitmap structs
> b1cb33dae414 platform/x86: intel_pmc_core: Clean up: Remove comma after the termination line)
> 
> But they are not available in for-next branch. I am confused, how that could be the case. For me to base the current series on for-next branch, the dependency patch series should be available in for-next branch.

I'm wondering how did you check it?
The branch location is in this [1] tree.

[1]: http://git.infradead.org/linux-platform-drivers-x86.git

-- 
With Best Regards,
Andy Shevchenko
