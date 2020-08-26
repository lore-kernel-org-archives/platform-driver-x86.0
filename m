From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH 0/3] integrity: Load certs from EFI MOK config table
Date: Wed, 26 Aug 2020 07:55:10 -0400
Message-ID: <6f63a0cf1349281ef2c407d95abedfba1f90345a.camel@linux.ibm.com>
References: <20200826034455.28707-1-lszubowi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200826034455.28707-1-lszubowi@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lenny Szubowicz <lszubowi@redhat.com>, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, ardb@kernel.org, jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, bp@alien8.de, pjones@redhat.com, dhowells@redhat.com, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

Hi Lenny,

On Tue, 2020-08-25 at 23:44 -0400, Lenny Szubowicz wrote:
> Because of system-specific EFI firmware limitations,
> EFI volatile variables may not be capable of holding the
> required contents of the Machine Owner Key (MOK) certificate
> store. Therefore, an EFI boot loader may pass the MOK certs
> via a EFI configuration table created specifically for this
> purpose to avoid this firmware limitation.
> 
> An EFI configuration table is a simpler and more robust mechanism
> compared to EFI variables and is well suited for one-way passage
> of static information from a pre-OS environment to the kernel.
> 
> This patch set does not remove the support for loading certs
> from the EFI MOK variables into the platform key ring.
> However, if both the EFI MOK config table and corresponding
> EFI MOK variables are present, the MOK table is used as the
> source of MOK certs.
> 
> The contents of the individual named MOK config table entries are
> made available to user space via read-only sysfs binary files under:
> 
> 	/sys/firmware/efi/mok-variables/

Please include a security section in this cover letter with a
comparison of the MoK variables and the EFI configuration table
security (eg. same mechanism?).  Has mokutil been updated?  If so,
please provide a link.

Mimi
