From: Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Thu, 7 May 2020 19:47:29 +0100
Message-ID: <CAD2FfiEk8Fq3=i_3NHvtuwip=-v_cGfnYSowdPi86U_BcgP2gQ@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com> <aa217de398584fa7846cf4ac0c872036@AUSX13MPC101.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <aa217de398584fa7846cf4ac0c872036@AUSX13MPC101.AMER.DELL.COM>
Sender: owner-linux-security-module@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 7 May 2020 at 18:45, <Mario.Limonciello@dell.com> wrote:
> To echo Andy's question, I would wonder if it makes sense to just export
> these attributes in securityfs directly from the intel-spi-pci driver rather
> than to have another driver in platform-x86 to get the information.

The "DANGEROUS" in the SPI_INTEL_SPI_PCI and SPI_INTEL_SPI_PLATFORM
worried me somewhat. I'm guessing this is why most distros don't
compile it as a module by default. If the module isn't actually still
considered dangerous, and we can remove the warning I can of course
respin my patch on top of that instead.

Richard.
