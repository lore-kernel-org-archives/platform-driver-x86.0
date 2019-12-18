From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] admin guide/pm: Admin guide for Intel Uncore
 Frequency limits
Date: Wed, 18 Dec 2019 18:50:22 +0200
Message-ID: <CAHp75Vf_X-aTNtrNpC1feKTLEUTvZVT2LA9535i+QXCwNzv=xw@mail.gmail.com>
References: <20191214001408.4878-1-srinivas.pandruvada@linux.intel.com> <20191214001408.4878-2-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191214001408.4878-2-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Linux Documentation List <linux-doc@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Dec 14, 2019 at 2:15 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> Added documentation for the attributes to control uncore frequency
> selection.
>

I need either Ack for this one, or take mine for patch 1.

> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  Documentation/admin-guide/pm/intel_uncore.rst | 23 +++++++++++++++++++
>  .../admin-guide/pm/working-state.rst          |  1 +
>  2 files changed, 24 insertions(+)
>  create mode 100644 Documentation/admin-guide/pm/intel_uncore.rst
>
> diff --git a/Documentation/admin-guide/pm/intel_uncore.rst b/Documentatio=
n/admin-guide/pm/intel_uncore.rst
> new file mode 100644
> index 000000000000..0986d9ab59d6
> --- /dev/null
> +++ b/Documentation/admin-guide/pm/intel_uncore.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +Intel=C2=AE Uncore Frequency Selection
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The uncore frequency in the Intel(R) hardware is selected based on inter=
nal heuristics, which uses the current selected performance state and vario=
us system power constraints. In majority of the cases this selection is the=
 most optimal, so there is no need for placing external constraints from th=
e Operating System.
> +
> +But there are some customers who wants less jitters from dynamic uncore =
frequency selection. For them, power saving is much lower priority than con=
sistent performance. Currently these customers uses MSR 0x620, to place har=
d limits on the maximum and the minimum uncore frequency. They can now use =
Linux sysfs to place these limits and also have additional capability to pl=
ace hard limits under power constraint scenario.
> +
> +The Uncore frequency section attributes are present under "/sys/devices/=
system/cpu/intel_uncore_frequency".
> +The scope of these attributes is per die in multi-die systems or package=
 wide in non multi-die systems. There is a unique folder for each die or pa=
ckage. For example:
> +"package_00_die_00" for package 0 and die 0.
> +
> +Attributes:
> +
> +power_up_max_freq_khz (READ ONLY): This is the power up value of the max=
imum uncore frequency in KHz. This is sampled during the driver initializat=
ion time. This is not the absolute maximum uncore frequency as there is no =
capability for the Operating System to read that. This can be used as a ref=
erence to roll back settings once user changed this limit.
> +
> +power_up_min_freq_khz (READ ONLY): This is the power up value of the min=
imum uncore frequency in KHz. This is not the absolute minimum uncore frequ=
ency. This can be used as a reference to roll back settings once user chang=
ed this limit.
> +
> +max_freq_khz (READ, WRITE): This presents current maximum uncore frequen=
cy. User can modify this attribute to change to a new maximum uncore freque=
ncy in KHz.
> +
> +min_freq_khz (READ, WRITE): This presents current minimum uncore frequen=
cy. User can modify this attribute to change to a new minimum uncore freque=
ncy in KHz.
> diff --git a/Documentation/admin-guide/pm/working-state.rst b/Documentati=
on/admin-guide/pm/working-state.rst
> index fc298eb1234b..15094cf0a234 100644
> --- a/Documentation/admin-guide/pm/working-state.rst
> +++ b/Documentation/admin-guide/pm/working-state.rst
> @@ -11,3 +11,4 @@ Working-State Power Management
>     cpufreq
>     intel_pstate
>     intel_epb
> +   intel_uncore
> --
> 2.17.2
>


--=20
With Best Regards,
Andy Shevchenko
