From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Thu, 04 Jan 2018 07:08:35 -0800
Message-ID: <1515078515.3864.8.camel@HansenPartnership.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <CALXu0Uf6qOg4-4aEfepD9hxXsbUtayndNC-nWc_Ymc5psCdEwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALXu0Uf6qOg4-4aEfepD9hxXsbUtayndNC-nWc_Ymc5psCdEwQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cedric Blancher <cedric.blancher@gmail.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2018-01-04 at 15:17 +0100, Cedric Blancher wrote:
> So how does this protect against the MELTDOWN attack (CVE-2017-5754)
> and the MELTATOMBOMBA4 worm which uses this exploit?

Actually, a data exfiltration attack against SGX, using page tables has
already been documented:

https://www.usenix.org/conference/usenixsecurity17/technical-sessions/presentation/van-bulck

It doesn't exploit speculation as the mechanism for gathering data (it
exploits page faults), but the structure of the side channel attack
used to exfiltrate data from the supposedly secure enclave is very
similar to Spectre.  The targetting mechanism is very different,
though: the page table exploit assumes you can control the page tables,
so you must be highly privileged on the platform but with Spectre you
merely have to be an ordinary user.

James
