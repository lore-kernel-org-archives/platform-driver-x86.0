From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v17 07/23] x86/mm: x86/sgx: Add new 'PF_SGX' page fault
 error code bit
Date: Fri, 16 Nov 2018 15:33:35 -0800
Message-ID: <38993cf5-039a-d582-1759-876cb948c582@intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-8-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116010412.23967-8-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 11/15/18 5:01 PM, Jarkko Sakkinen wrote:
> The SGX bit is set in the #PF error code if and only if the fault is
> detected by the Enclave Page Cache Map (EPCM), a hardware-managed
> table that enforces the paging permissions defined by the enclave,
> e.g. to prevent the kernel from changing the permissions of an
> enclave's page(s).

This should probably also mention that, despite being a page fault,
X86_PF_SGX has nothing to do with paging itself.
