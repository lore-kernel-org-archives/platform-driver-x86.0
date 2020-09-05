From: Lenny Szubowicz <lszubowi@redhat.com>
Subject: Re: [PATCH 0/3] integrity: Load certs from EFI MOK config table
Date: Fri, 4 Sep 2020 21:30:38 -0400
Message-ID: <1e4d1f97-e1c1-d76d-1f91-135290da625c@redhat.com>
References: <20200826034455.28707-1-lszubowi@redhat.com>
 <6f63a0cf1349281ef2c407d95abedfba1f90345a.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <6f63a0cf1349281ef2c407d95abedfba1f90345a.camel@linux.ibm.com>
Content-Language: en-US
Sender: owner-linux-security-module@vger.kernel.org
To: Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org, ardb@kernel.org, jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, bp@alien8.de, pjones@redhat.com, dhowells@redhat.com, prarit@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On 8/26/20 7:55 AM, Mimi Zohar wrote:
> Hi Lenny,
> 
> On Tue, 2020-08-25 at 23:44 -0400, Lenny Szubowicz wrote:
>> Because of system-specific EFI firmware limitations,
>> EFI volatile variables may not be capable of holding the
>> required contents of the Machine Owner Key (MOK) certificate
>> store. Therefore, an EFI boot loader may pass the MOK certs
>> via a EFI configuration table created specifically for this
>> purpose to avoid this firmware limitation.
>>
>> An EFI configuration table is a simpler and more robust mechanism
>> compared to EFI variables and is well suited for one-way passage
>> of static information from a pre-OS environment to the kernel.
>>
>> This patch set does not remove the support for loading certs
>> from the EFI MOK variables into the platform key ring.
>> However, if both the EFI MOK config table and corresponding
>> EFI MOK variables are present, the MOK table is used as the
>> source of MOK certs.
>>
>> The contents of the individual named MOK config table entries are
>> made available to user space via read-only sysfs binary files under:
>>
>> 	/sys/firmware/efi/mok-variables/
> 
> Please include a security section in this cover letter with a
> comparison of the MoK variables and the EFI configuration table
> security (eg. same mechanism?).  Has mokutil been updated?  If so,
> please provide a link.
> 
> Mimi
> 

I've included some more information about the MOK config table
entries in the V2 cover letter.

[root@localhost ~]# ls -l /sys/firmware/efi/mok-variables
total 0
-r--------. 1 root root     0 Sep  4 21:10 MokIgnoreDB
-r--------. 1 root root 18184 Sep  4 21:10 MokListRT
-r--------. 1 root root    76 Sep  4 21:10 MokListXRT
-r--------. 1 root root     0 Sep  4 21:10 MokSBStateRT

The roughly 18KB of data in /sys/firmware/efi/mok-variables/MokListRT
is exactly the same data that is returned by a EFI GetVariable()
call for MokListRT. Of course, that's on a system where the EFI
firmware can handle a volatile variable with that much data.

Therefore, load_moklist_certs() can pass the mokvar_entry data directly
to parse_efi_signature_list() in the same way it does for the
efi.get_variable() data that it obtains via get_cert_list().

Unfortunately, there is no updated mokutil available yet that
uses the new sysfs entries.

Also relevant is availability of an updated shim, which builds
the EFI MOK variable configuration table.

Of course, both of these should show up as upstream pull requests
and also in Fedora rawhide at some point.

Thank you for your review.

                       -Lenny.
